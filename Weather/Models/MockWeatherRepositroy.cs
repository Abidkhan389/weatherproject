using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Weather.ViewModels;

namespace Weather.Models
{
    public class MockWeatherRepositroy : IWeatherRepositroy
    {
        private readonly WeatherDBContext _weatherDBContext;
        public MockWeatherRepositroy( WeatherDBContext weatherDBContext)
        {
            this._weatherDBContext = weatherDBContext;
        }
        public async Task<List<Weather>> GetListWeather()
        {
            return await _weatherDBContext.Weathers.ToListAsync();
        }
        public async Task<Weather> Create(Weather newweather)
        {
            await _weatherDBContext.Weathers.AddAsync(newweather);
            await _weatherDBContext.SaveChangesAsync();
            return newweather;
        }

        public async Task<Weather> Delete(Weather deleteobj)
        {
            Weather weather1 =await _weatherDBContext.Weathers.FirstOrDefaultAsync(x=> x.CityName.ToUpper()==deleteobj.CityName.ToUpper());
            if (weather1 != null) 
            {
                _weatherDBContext.Weathers.Remove(weather1);
                await _weatherDBContext.SaveChangesAsync();
            }
            return weather1;
        }
        public async Task<Weather> GetWeatherbyid(int id)
        {
            return await _weatherDBContext.Weathers.Where(x => x.Id ==id).FirstOrDefaultAsync();
        }

        public async Task<Weather> GetWeather(string cityname)
        {            
            return await _weatherDBContext.Weathers.Where(x=> x.CityName.ToUpper()==cityname.ToUpper()).FirstOrDefaultAsync();
        }

        public async Task<Weather> Update(WeatherEditViewModel model)
        {

            // insert into history table
            Weather weather = new Weather();

            weather = await _weatherDBContext.Weathers.Where(x => x.CityName.ToUpper() == model.City_Name.ToUpper()).FirstOrDefaultAsync();
            
            WeatherHistory weatherHistory = new WeatherHistory();
            weatherHistory.CityName = weather.CityName;
            weatherHistory.TempDate = weather.TempDate;
            weatherHistory.TempTime = weather.TempTime;
            weatherHistory.Temperature = weather.Temperature;
            weatherHistory.WeatherId = weather.Id;

            _weatherDBContext.WeatherHistories.Add(weatherHistory);

            weather.CityName = model.City_Name;
            weather.TempDate = model.Date;
            weather.TempTime = model.Time.TimeOfDay;
            weather.Temperature = model.temprature;

           
            //update into weather table
            var Updateweather = _weatherDBContext.Weathers.Attach(weather);
            Updateweather.State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            _weatherDBContext.SaveChanges();
            return await _weatherDBContext.Weathers.Where(xid=> xid.CityName.ToLower() == model.City_Name.ToLower()).FirstOrDefaultAsync();
        }

        public  async Task<List<WeatherHistory>> GetWeatherHistroy(string weatherHistorybyCityName)
        {
            return await _weatherDBContext.WeatherHistories.Where(x=> x.CityName.ToUpper() == weatherHistorybyCityName.ToUpper()).ToListAsync();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Weather.ViewModels;

namespace Weather.Models
{
    public interface IWeatherRepositroy
    {
        Task<Weather> GetWeather(string cityname);
        Task<Weather> Create(Weather weather);
        Task<Weather> Update(WeatherEditViewModel model);
        Task<Weather> Delete(Weather obj);
        Task<Weather> GetWeatherbyid(int id);
        Task<List<Weather>> GetListWeather();
        Task<List<WeatherHistory>> GetWeatherHistroy(string weatherHistory);

    }
}

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Weather.Models;
using Weather.ViewModels;
namespace Weather.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {

        private readonly IWeatherRepositroy _iweatherRepositroy;
        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger,IWeatherRepositroy iweatherRepositroy)
        {
            _logger = logger;
            this._iweatherRepositroy = iweatherRepositroy;
        }

        [HttpGet]
       
        public async Task<IActionResult> Get(string name)
        {
            try
            {
                var model = await _iweatherRepositroy.GetWeather(name); 
                return Ok(model);
            }
            catch(Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error in Retriving data from Database ");
            }
        }
        [HttpGet]
        [Route("GetHistroy")]
        public async Task<IActionResult> GetHistroy(string name) 
        {
            try
            {
                var model = await _iweatherRepositroy.GetWeatherHistroy(name);
                return Ok(model);
            }
            catch(Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                    "Error in Retriving data from Database ");
            }
           
        }
        [HttpGet]
        [Route("GetListWeather")]
        public async Task<IActionResult> GetListWeather()
        {
            var result=await _iweatherRepositroy.GetListWeather();
            return Ok(result) ;
        }

        [HttpPost]
        //[Route("create")]
        public async Task<IActionResult> Post(WeatherCreateViewModel model)
        {
            if(ModelState.IsValid)
            {
                Models.Weather weather = new Models.Weather() 
                { 
                    CityName=model.City_Name,
                    TempDate=model.Date.Date,
                    TempTime=model.Time.TimeOfDay,
                    Temperature=model.temprature,
                    
                };
                await _iweatherRepositroy.Create(weather);
                return Ok(weather);
            }
            else
             return BadRequest();
              
        }
        
        [HttpPut]
        public async Task<IActionResult> Put(WeatherEditViewModel model)
        {
            if (ModelState.IsValid)
            {
               
                await _iweatherRepositroy.Update(model);
                return Ok(model);
            }
            else
                return BadRequest();
        }
        [HttpDelete]
        public async Task<IActionResult> Delete(string cityname)
        {
            Models.Weather weather = new Models.Weather();
            weather = await _iweatherRepositroy.GetWeather(cityname);
            if (ModelState.IsValid)
            {
                await _iweatherRepositroy.Delete(weather);
                return Ok(weather);
            }
            else
                return BadRequest();
        }
        [HttpGet]
        [Route("GetSpresult")]
        public async Task<IActionResult> GetSpresult(int id)
        {
            List<SPProcedure> result =await _iweatherRepositroy.GetSpResult(id);
            return Ok(result);
        }


    }
}

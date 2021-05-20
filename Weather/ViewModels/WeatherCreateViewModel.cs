using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Weather.ViewModels
{
    public class WeatherCreateViewModel
    {
        private string _Cityname;
        private DateTime _Date;
        private DateTime _Time;
        private float _temprature;
        [Required]
        public string City_Name
        {
            get { return _Cityname; }
            set { this._Cityname = value; }
        }
        [Required]
        public DateTime Date
        {
            get { return _Date; }
            set { this._Date = value; }
        }
        [Required]
        public DateTime Time
        {
            get { return _Time; }
            set { this._Time = value; }
        }
        [Required]
        public float temprature
        {
            get { return _temprature; }
            set { this._temprature = value; }
        }
    }
}

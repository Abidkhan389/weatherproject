using System;
using System.Collections.Generic;

#nullable disable

namespace Weather.Models
{
    public partial class Weather
    {
        public int Id { get; set; }
        public string CityName { get; set; }
        public DateTime? TempDate { get; set; }
        public TimeSpan? TempTime { get; set; }
        public double? Temperature { get; set; }
    }
}

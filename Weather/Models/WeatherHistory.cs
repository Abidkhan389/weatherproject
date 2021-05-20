using System;
using System.Collections.Generic;

#nullable disable

namespace Weather.Models
{
    public partial class WeatherHistory
    {
        public int Id { get; set; }
        public string CityName { get; set; }
        public DateTime? TempDate { get; set; }
        public TimeSpan? TempTime { get; set; }
        public double? Temperature { get; set; }
        public int? WeatherId { get; set; }
    }
}

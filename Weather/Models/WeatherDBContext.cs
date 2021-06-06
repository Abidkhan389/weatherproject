using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Weather.ViewModels;

#nullable disable

namespace Weather.Models
{
    public partial class WeatherDBContext : DbContext
    {
        //public WeatherDBContext()
        //{
        //}

        public WeatherDBContext(DbContextOptions<WeatherDBContext> options)
            : base(options)
        {
        }
        public virtual DbSet<SPProcedure> spprocedure { get; set; }
        public virtual DbSet<Weather> Weathers { get; set; }
        public virtual DbSet<WeatherHistory> WeatherHistories { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-RMDDIVJ\\SQLEXPRESS;Database=WeatherDB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SPProcedure>(entity => { entity.HasNoKey(); });
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Weather>(entity =>
            {
                entity.ToTable("Weather");

                entity.HasIndex(e => e.CityName, "UQ__Weather__886159E5D2FD2040")
                    .IsUnique();

                entity.HasIndex(e => e.CityName, "cityname_unique")
                    .IsUnique();

                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.TempDate).HasColumnType("date");
            });

            modelBuilder.Entity<WeatherHistory>(entity =>
            {
                entity.ToTable("WeatherHistory");

                entity.Property(e => e.CityName).HasMaxLength(256);

                entity.Property(e => e.TempDate).HasColumnType("date");

                entity.Property(e => e.WeatherId).HasColumnName("weatherId");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

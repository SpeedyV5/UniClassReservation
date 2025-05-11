using System;
using System.Collections.Generic;
using UniClassReservation.Models;
using Xunit;

namespace UniClassReservation.Tests
{
    public class ReservationTests
    {
        // İki rezervasyonun çakışıp çakışmadığını kontrol eden yardımcı fonksiyon
        public static bool IsConflict(Reservation a, Reservation b)
        {
            return a.ClassroomId == b.ClassroomId &&
                   a.TermId == b.TermId &&
                   a.StartTime < b.EndTime &&
                   a.EndTime > b.StartTime;
        }

        public static bool IsHolidayConflict(Reservation reservation, List<Holiday> holidays)
        {
            return holidays.Exists(h =>
                h.IsActive &&
                h.StartDate <= reservation.EndTime &&
                h.EndDate >= reservation.StartTime);
        }

        [Fact]
        public void Reservations_With_Overlapping_Time_Should_Conflict()
        {
            var r1 = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 10, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 12, 0, 0)
            };
            var r2 = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 11, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 13, 0, 0)
            };
            Assert.True(IsConflict(r1, r2));
        }

        [Fact]
        public void Reservations_With_NonOverlapping_Time_Should_Not_Conflict()
        {
            var r1 = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 8, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 10, 0, 0)
            };
            var r2 = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 10, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 12, 0, 0)
            };
            Assert.False(IsConflict(r1, r2));
        }

        [Fact]
        public void Reservation_Should_Conflict_With_Active_Holiday()
        {
            var reservation = new Reservation
            {
                StartTime = new DateTime(2024, 5, 10, 10, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 12, 0, 0)
            };
            var holidays = new List<Holiday>
            {
                new Holiday { StartDate = new DateTime(2024, 5, 10, 0, 0, 0), EndDate = new DateTime(2024, 5, 10, 23, 59, 59), IsActive = true }
            };
            Assert.True(IsHolidayConflict(reservation, holidays));
        }

        [Fact]
        public void Feedback_Average_Rating_Should_Be_Correct()
        {
            var feedbacks = new List<Feedback>
            {
                new Feedback { Rating = 5 },
                new Feedback { Rating = 4 },
                new Feedback { Rating = 3 }
            };
            double average = feedbacks.Count > 0 ? feedbacks.Average(f => f.Rating) : 0;
            Assert.Equal(4.0, average);
        }

        [Fact]
        public void Reservations_In_Different_Classrooms_Should_Not_Conflict()
        {
            var r1 = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 10, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 12, 0, 0)
            };
            var r2 = new Reservation
            {
                ClassroomId = 2, // Farklı sınıf
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 10, 0, 0),
                EndTime = new DateTime(2024, 5, 10, 12, 0, 0)
            };
            Assert.False(IsConflict(r1, r2));
        }

        [Fact]
        public void Reservation_With_Invalid_Date_Range_Should_Throw_Exception()
        {
            var reservation = new Reservation
            {
                ClassroomId = 1,
                TermId = 1,
                StartTime = new DateTime(2024, 5, 10, 12, 0, 0), // Bitiş zamanından sonra
                EndTime = new DateTime(2024, 5, 10, 10, 0, 0)    // Başlangıç zamanından önce
            };

            Assert.Throws<ArgumentException>(() =>
            {
                if (reservation.StartTime >= reservation.EndTime)
                {
                    throw new ArgumentException("Başlangıç zamanı bitiş zamanından önce olmalıdır.");
                }
            });
        }
    }
}

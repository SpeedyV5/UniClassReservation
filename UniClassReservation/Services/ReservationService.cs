using System;
using System.Collections.Generic;
using System.Linq;
using UniClassReservation.Models;

namespace UniClassReservation.Services
{
    public class ReservationService : IReservationService
    {
        public bool HasConflict(Reservation reservation, IEnumerable<Reservation> existingReservations)
        {
            return existingReservations.Any(r =>
                r.Id != reservation.Id &&
                r.ClassroomId == reservation.ClassroomId &&
                r.TermId == reservation.TermId &&
                r.Status != "Rejected" &&
                r.StartTime < reservation.EndTime &&
                r.EndTime > reservation.StartTime);
        }

        public bool HasHolidayConflict(Reservation reservation, IEnumerable<Holiday> holidays)
        {
            var reservationDays = Enumerable.Range(0, (reservation.EndTime.Date - reservation.StartTime.Date).Days + 1)
                .Select(offset => reservation.StartTime.Date.AddDays(offset));
            return holidays.Any(h =>
                h.IsActive &&
                reservationDays.Any(day => day >= h.StartDate.Date && day <= h.EndDate.Date));
        }
    }
} 
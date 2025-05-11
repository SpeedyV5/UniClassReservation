using System;
using System.Collections.Generic;
using UniClassReservation.Models;

namespace UniClassReservation.Services
{
    public interface IReservationService
    {
        bool HasConflict(Reservation reservation, IEnumerable<Reservation> existingReservations);
        bool HasHolidayConflict(Reservation reservation, IEnumerable<Holiday> holidays);
    }
} 
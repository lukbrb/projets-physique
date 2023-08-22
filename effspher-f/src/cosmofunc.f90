module cosmofunc
    implicit none
    private

    public :: H, eq_diff_lin, eq_diff, di, ti, t_max, age_univers
    
    real, parameter :: Mp = 3.08567758 * 1E22  ! Valeur d un mégaparsec
    real, parameter :: H0 = 7 * 1e4 / Mp
    real, parameter :: Gyr = 3600. * 24. * 365. * 1E09
    real, parameter :: ti = (300000. * 365. * 24. * 3600.) / Gyr
    real, parameter :: di = 0.0017104343414306644
    real, parameter :: t_max = (1 / H0) / Gyr
    real, parameter :: age_univers =  (2 / (3 * H0)) / Gyr

contains

    real function H(t) result(hubble_cst)
        real, intent(in) :: t
        hubble_cst = 2 / (3 * t)
    end function H

    real function eq_diff_lin(d, p, t) result(val_eq)
        real, intent(in) :: d, p, t
        val_eq = -2 * H(t) * p + 1.5 * (H(t) ** 2) * d
    end function eq_diff_lin

    real function eq_diff(d, p, t) result(val_eq)
    real, intent(in) :: d, p, t
    val_eq = -2 * H(t) * p + 1.5 * (H(t) ** 2) * d * (1. + d) + (4. / 3.) * ((p ** 2) / (1. + d))
    end function eq_diff

end module cosmofunc
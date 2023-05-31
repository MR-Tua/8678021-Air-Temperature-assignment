program Kelvin_Degree_Change
    implicit none
    character(len=100) :: input_file = "air-temperature-values-Kelvin.csv"
    character(len=100) :: output_file = "8678021_Air-Temperature-Assignment.csv"
    real, dimension(:), allocatable :: degree_values, kelvin_values
    integer :: num_temps, i
    
    ! Read the number of temperature values
    num_temps = count_lines(input_file)
    
    ! Allocate memory for arrays
    allocate(degree_values(num_temps))
    allocate(kelvin_values(num_temps))
    
    ! Read the temperature values
    open(unit=10, file=input_file, status='old', action='read')
    do i = 1, num_temps
        read(10, *) degree_values(i)
        kelvin_values(i) = degree_values(i) + 273.15
    end do
    close(10)
    
    ! Write the converted temperature values to the output file
    open(unit=20, file=output_file, status='new', action='write')
    write(20, '(F8.2)') kelvin_values
    close(20)
    
    write(*, *) "The Degree values have successfully been changed to Kelvin!"

contains

    function count_lines(file_name) result(count)
        character(len=*), intent(in) :: file_name
        integer :: unit, count
        character(len=100) :: line
        
        open(unit=unit, file=file_name, status='old', action='read')
        count = 0
        do
            read(unit, '(A)', iostat=i) line
            if (i /= 0) exit
            count = count + 1
        end do
        close(unit)
    end function count_lines

end program Kelvin_Degree_Change


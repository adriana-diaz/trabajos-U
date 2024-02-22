year = int(input("Introduzca un año para comprobar si es un año bisiesto\n"))
if (year % 4) == 0:
    if (year % 100) == 0:
        if (year % 400) == 0:
            print("{0} es un año bisiesto".format(year))
        else:
            print("{0} no es un año bisiesto".format(year))
    else:
        print("{0} es un año bisiesto".format(year))
else:
    print("{0} no es un año bisiesto".format(year))

def convert_temperature():
    temp_type = input("Enter temperature type (C for Celsius, F for Fahrenheit): ")
    input_temp = 0
    output_temp = 0
    if temp_type == "C":
        input_temp = float(input("Enter temperature in Celsius: "))
    else:
        input_temp = float(input("Enter temperature in Fahrenheit: "))

    if temp_type == "C":
        output_temp = (input_temp * 9 / 5) + 32
        print(f"{input_temp}C is equal to {output_temp}F")
    else:
        output_temp = (input_temp - 32) * 5 / 9
        print(f"{input_temp}F is equal to {output_temp}C")


convert_temperature()

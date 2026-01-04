# Problema 3 a) Calcular el resto de dividir 6^720040 entre 17
base = 6
exponente = 720040
modulo = 17

# La función pow(base, exp, mod) es muy eficiente para exponenciación modular
resultado_a = pow(base, exponente, modulo)

print(f"Resultado del problema 3 a): {resultado_a}")

# Problema 3 b) Pasar a hexadecimal, octal y binario el número 2020
numero_decimal = 2020

# Conversión a hexadecimal (prefijo '0x')
hexadecimal = hex(numero_decimal)

# Conversión a octal (prefijo '0o')
octal = oct(numero_decimal)

# Conversión a binario (prefijo '0b')
binario = bin(numero_decimal)

print(f"\nResultado del problema 3 b) para el número {numero_decimal}:")
# Mostramos el resultado eliminando los prefijos y en mayúsculas para hexadecimal
print(f"Hexadecimal: {hexadecimal[2:].upper()}")
print(f"Octal:       {octal[2:]}")
print(f"Binario:     {binario[2:]}")
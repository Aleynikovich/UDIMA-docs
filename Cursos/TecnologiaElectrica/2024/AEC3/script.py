from sympy import symbols, sqrt

# Datos iniciales
V_line = 380  # Tensión de línea (V)
rho_copper = 0.02198  # Resistividad del cobre (ohm mm²/m)
reactance = 0.08  # Reactancia de los cables (ohm/km)
sqrt3 = sqrt(3)  # Raíz de 3 para trifásico

# Secciones comerciales de las líneas obtenidas del ejercicio anterior (en mm²)
sections = {
    "LA": 16,
    "L1": 6,
    "L2": 10,
    "LC1": 2.5,
    "LC2": 6,
    "LC3": 4,
}

# Longitudes de las líneas en metros
lengths = {
    "LA": 5,
    "L1": 83,
    "L2": 25,
    "LC1": 7,
    "LC2": 7,
    "LC3": 23,
}

# Calcular R y X para cada línea
impedances = {}
for line, section in sections.items():
    length = lengths[line]
    R = (rho_copper * length) / section  # Resistividad del conductor
    X = (reactance * length) / 1000  # Reactancia del conductor
    Z_max = R + X  # Impedancia máxima (considerando reactancia)
    Z_min = R  # Impedancia mínima (sin reactancia)
    impedances[line] = {"Z_max": Z_max, "Z_min": Z_min}

# Cálculo de las intensidades de cortocircuito
I_cc_values = {}
for line, Z in impedances.items():
    I_cc_max = V_line / Z["Z_min"]  # Intensidad máxima
    I_cc_min = V_line / Z["Z_max"]  # Intensidad mínima
    I_cc_values[line] = {"I_cc_max": I_cc_max, "I_cc_min": I_cc_min}

# Resultados
print("Resultados de intensidades de cortocircuito:")
for line, values in I_cc_values.items():
    print(f"{line}: I_cc_max = {values['I_cc_max']:.2f} A, I_cc_min = {values['I_cc_min']:.2f} A")

# Redefine the subjects and dependencies for the Hasse diagram based on the new problem.
subjects = ["A", "C", "D", "F", "ED", "Q", "E", "M", "P", "O", "MO"]
dependencies = [
    ("A", "C"), ("A", "D"), ("A", "ED"), ("A", "F"),
    ("C", "ED"), ("C", "F"),
    ("F", "Q"), ("F", "M"), ("F", "E"), 
    ("E", "O"), ("Q", "O"), ("M", "O"), 
    ("MO", "O"), ("P", "O"),
    ("D", "P"), ("C", "MO"), ("F", "MO"), ("ED", "MO")
]

# Create a directed graph for dependencies
G_dependencies = nx.DiGraph()

# Add nodes and edges
G_dependencies.add_nodes_from(subjects)
G_dependencies.add_edges_from(dependencies)

# Plot the Hasse diagram
plt.figure(figsize=(12, 10))
pos = nx.planar_layout(G_dependencies)  # Use a layout suitable for Hasse diagrams

# Draw the graph
nx.draw(G_dependencies, pos, with_labels=True, node_size=1000, font_size=10, arrows=False, node_color="lightgreen")
nx.draw_networkx_edges(G_dependencies, pos, edgelist=dependencies, connectionstyle='arc3,rad=0.1')

# Title and display
plt.title("Diagrama de Hasse para las dependencias de asignaturas en Ingeniería Óptica")
plt.show()

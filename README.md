# Non-Linear Optimization & Network Analysis Library

A collection of algorithms implemented in **MATLAB** to solve unconstrained non-linear optimization problems and weighted graph routing challenges. This project focuses on analyzing convergence rates and computational efficiency.

## Algorithms Implemented

### 1. Gradient-Based Optimization
* **Fletcher-Reeves Method (`fletcher_reeves.m`):** Implementation of the **Conjugate Gradient** method for non-linear functions.
    * Uses `fminbnd` for exact line search steps.
    * Achieves **superlinear convergence** on quadratic forms.
    * Ideal for high-dimensional problems where Hessian computation is expensive.

### 2. Derivative-Free Optimization (Direct Search)
* **Hooke-Jeeves Method (`hooke_jeeves.m`):** A **Pattern Search** algorithm that does not require gradient information.
    * Implements exploratory moves and pattern moves.
    * Robust for non-differentiable or noisy objective functions.

### 3. 1D Search Methods
* **Fibonacci Search (`fibonacci_search.m`):** Efficient interval reduction technique using Fibonacci numbers.
    * Optimizes unimodal functions with a reduction ratio of approx $1/\phi$ (Golden Ratio).

### 4. Graph Theory & Routing
* **Dijkstra's Algorithm (`dijkstra_routing.m`):** A custom implementation for finding shortest paths in weighted graphs.
    * **Complexity:** Optimized adjacency matrix handling for $O(V^2)$ performance.
    * Solves the single-source shortest path problem.

##  Tech Stack
* **Language:** MATLAB
* **Focus:** Numerical Optimization, Convex Analysis, Graph Theory.

##  Performance Notes
The implementations include convergence checks based on gradient norms ($\|\nabla f\| < \epsilon$) and step size tolerances, ensuring stability near local minima.

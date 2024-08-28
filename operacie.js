document.addEventListener('DOMContentLoaded', () => {
    console.log("DOM fully loaded and parsed");

    const menuButton = document.getElementById('menuButton');
    const mainCourseButton = document.getElementById('mainCourseButton');
    const appetizerButton = document.getElementById('appetizerButton');
    const dessertButton = document.getElementById('dessertButton');
    const orderForm = document.getElementById('orderForm');

    if (menuButton) {
        menuButton.addEventListener('click', function() {
            console.log("Menu button clicked");
            window.location.href = 'menu.html';
        });
    } else {
        console.error("Menu button not found");
    }

    if (mainCourseButton) {
        mainCourseButton.addEventListener('click', function() {
            console.log("Main Course button clicked");
            window.location.href = 'main_course.html';
        });
    } else {
        console.error("Main Course button not found");
    }

    if (appetizerButton) {
        appetizerButton.addEventListener('click', function() {
            console.log("Appetizer button clicked");
            window.location.href = 'appetizers.html';
        });
    } else {
        console.error("Appetizer button not found");
    }

    if (dessertButton) {
        dessertButton.addEventListener('click', function() {
            console.log("Dessert button clicked");
            window.location.href = 'desserts.html';
        });
    } else {
        console.error("Dessert button not found");
    }

    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.add-to-cart').forEach(button => {
            button.addEventListener('click', () => {
                const foodItem = button.closest('.food-item');
                const item = {
                    name: foodItem.getAttribute('data-name'),
                    price: parseFloat(foodItem.getAttribute('data-price')),
                    description: foodItem.getAttribute('data-description')
                };
    
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart.push(item);
                localStorage.setItem('cart', JSON.stringify(cart));
    
                alert(`${item.name} added to cart`);
            });
        });
    });
    

    if (orderForm) {
        orderForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = new FormData(event.target);
            const items = formData.getAll('item');
            const name = formData.get('name');
            const email = formData.get('email');
            const address = formData.get('address');
            const cardNumber = formData.get('cardNumber');
            const expiryDate = formData.get('expiryDate');
            const cvv = formData.get('cvv');

            console.log('Order Details:', { items, name, email, address, cardNumber, expiryDate, cvv });
            alert('Thank you for your order!');
        });
    }

    const modal = document.getElementById('itemModal');
    const modalTitle = document.getElementById('modal-title');
    const modalDescription = document.getElementById('modal-description');
    const modalPrice = document.getElementById('modal-price');
    const addToCartButton = document.getElementById('addToCartButton');
    const cartItems = document.getElementById('cart-items');
    const cartTotal = document.getElementById('cart-total');
    let currentItem = null;

    document.querySelectorAll('.food-item').forEach(button => {
        button.addEventListener('click', () => {
            currentItem = {
                name: button.getAttribute('data-name'),
                price: button.getAttribute('data-price'),
                description: button.getAttribute('data-description')
            };

            modalTitle.textContent = currentItem.name;
            modalDescription.textContent = currentItem.description;
            modalPrice.textContent = `$${currentItem.price}`;
            modal.style.display = 'block';
        });
    });

    document.querySelector('.close').addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    if (addToCartButton) {
        addToCartButton.addEventListener('click', () => {
            if (currentItem) {
                const li = document.createElement('li');
                li.textContent = `${currentItem.name} - $${currentItem.price}`;
                cartItems.appendChild(li);

                const currentTotal = parseFloat(cartTotal.textContent);
                cartTotal.textContent = (currentTotal + parseFloat(currentItem.price)).toFixed(2);

                modal.style.display = 'none';
            }
        });
    } else {
        console.error("Add to Cart button not found");
    }
});
document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('cart-items')) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        const cartItems = document.getElementById('cart-items');
        const cartTotal = document.getElementById('cart-total');
        let total = 0;

        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = `${item.name} - $${item.price.toFixed(2)}`;
            cartItems.appendChild(li);
            total += item.price;
        });

        cartTotal.textContent = total.toFixed(2);

        document.getElementById('checkout').addEventListener('click', () => {
            window.location.href = 'order.html';
        });
    }
});

document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('orderForm')) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        const orderItems = document.getElementById('order-items');
        const orderTotal = document.getElementById('order-total');
        let total = 0;

        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = `${item.name} - $${item.price.toFixed(2)}`;
            orderItems.appendChild(li);
            total += item.price;
        });

        orderTotal.textContent = total.toFixed(2);

        document.getElementById('orderForm').addEventListener('submit', async (event) => {
            event.preventDefault();

            const formData = new FormData(event.target);
            const orderDetails = {
                items: cart,
                name: formData.get('name'),
                email: formData.get('email'),
                address: formData.get('address'),
                cardNumber: formData.get('cardNumber'),
                expiryDate: formData.get('expiryDate'),
                cvv: formData.get('cvv'),
                total: total.toFixed(2)
            };

            try {
                const response = await fetch('path_to_your_backend_endpoint', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(orderDetails)
                });

                if (response.ok) {
                    alert('Thank you for your order!');
                    localStorage.removeItem('cart');
                    window.location.href = 'confirmation.html';
                } else {
                    alert('Failed to place order. Please try again.');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('An error occurred while placing the order.');
            }
        });
    }
});

document.addEventListener('DOMContentLoaded', () => {
    // Handle adding items to the cart
    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', () => {
            const foodItem = button.closest('.food-item');
            const item = {
                name: foodItem.getAttribute('data-name'),
                price: parseFloat(foodItem.getAttribute('data-price')),
                description: foodItem.getAttribute('data-description')
            };

            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            cart.push(item);
            localStorage.setItem('cart', JSON.stringify(cart));

            alert(`${item.name} added to cart`);
        });
    });

    // Handle viewing the cart
    const viewCartButton = document.getElementById('viewCart');
    if (viewCartButton) {
        viewCartButton.addEventListener('click', () => {
            window.location.href = 'cart.html';
        });
    }
    
    // Display cart items in cart.html
    if (document.getElementById('cart-items')) {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        const cartItems = document.getElementById('cart-items');
        const cartTotal = document.getElementById('cart-total');
        let total = 0;

        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = `${item.name} - $${item.price.toFixed(2)}`;
            cartItems.appendChild(li);
            total += item.price;
        });

        cartTotal.textContent = total.toFixed(2);

        document.getElementById('checkout').addEventListener('click', () => {
            window.location.href = 'order.html';
        });
    }
});


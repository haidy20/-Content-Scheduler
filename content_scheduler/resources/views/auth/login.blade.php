
<h2>Login</h2>
<form id="loginForm">
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>

<script>
    document.getElementById('loginForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        const formData = new FormData(this);
        const data = {
            email: formData.get('email'),
            password: formData.get('password')
        };

        const response = await fetch('/api/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });

        const result = await response.json();

        if (result.status) {
            alert('Login successful!');
            localStorage.setItem('token', result.data.token);
            window.location.href = '/posts/create';
        } else {
            alert(result.message);
        }
    });
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auction Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1a2a6c, #b21f1f, #1a2a6c);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            overflow: hidden;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 60px;
            text-align: center;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
            max-width: 500px;
            width: 90%;
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 1s ease-out;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            z-index: -1;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 30px;
            color: #ffd700;
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
            letter-spacing: 1px;
            position: relative;
            padding-bottom: 20px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, transparent, #ffd700, transparent);
            border-radius: 2px;
        }

        .tagline {
            font-size: 1.1rem;
            margin-bottom: 40px;
            line-height: 1.6;
            color: #e0e0e0;
            opacity: 0.9;
        }

        .links {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-top: 30px;
        }

        .btn {
            padding: 14px 35px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            z-index: -1;
            transition: transform 0.4s ease;
            transform: scaleX(0);
            transform-origin: right;
        }

        .btn:hover::before {
            transform: scaleX(1);
            transform-origin: left;
        }

        .register {
            background: linear-gradient(45deg, #ff8c00, #ffd700);
            color: #1a1a2e;
        }

        .login {
            background: transparent;
            color: #ffd700;
            border: 2px solid #ffd700;
        }

        .btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        }

        .auction-hammer {
            font-size: 3.5rem;
            margin-bottom: 25px;
            animation: hammerSwing 3s infinite;
            display: inline-block;
            transform-origin: top center;
            text-shadow: 0 0 15px rgba(255, 215, 0, 0.7);
        }

        @keyframes hammerSwing {
            0%, 100% { transform: rotate(-10deg); }
            50% { transform: rotate(10deg); }
        }

        .footer {
            margin-top: 40px;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
            letter-spacing: 0.5px;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .container {
                padding: 30px;
            }

            h1 {
                font-size: 2.3rem;
            }

            .links {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="auction-hammer">🔨</div>
    <h1>Welcome to Auction System</h1>
    <p class="tagline">Bid, win, and discover unique items in our premium auction platform. Join our community today!</p>

    <div class="links">
        <a href="register.jsp" class="btn register">Register</a>
        <a href="login.jsp" class="btn login">Login</a>
    </div>

    <p class="footer">Experience the thrill of competitive bidding</p>
</div>
</body>
</html>
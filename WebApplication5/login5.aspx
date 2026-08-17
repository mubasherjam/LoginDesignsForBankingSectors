<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login5.aspx.cs" Inherits="WebApplication5.login5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AutoSoft Dynamics | ABC Bank Secure Portal</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; }
        html, body { height: 100%; }

        :root {
            --navy-deep: #0a1834;
            --navy-mid: #12275a;
            --blue-accent: #2563eb;
            --blue-bright: #4d8fe6;
            --gold: #d4af37;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #eef1fb 0%, #e4e9fb 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 32px 24px;
        }

        .anim-in { opacity: 0; transform: translateY(18px); animation: riseIn 0.6s cubic-bezier(0.22,1,0.36,1) forwards; }
        @keyframes riseIn { to { opacity: 1; transform: translateY(0); } }

        .split-shell {
            width: 100%;
            max-width: 1040px;
            min-height: 640px;
            background: #fff;
            border-radius: 30px;
            box-shadow: 0 40px 90px rgba(10, 24, 52, 0.22);
            display: flex;
            overflow: hidden;
            position: relative;
        }

        /* Soft seam glow between the two panels instead of a hard line */
        .split-shell::before {
            content: '';
            position: absolute; top: 0; bottom: 0; left: 50%;
            width: 60px; margin-left: -30px;
            background: linear-gradient(90deg, transparent, rgba(10,24,52,0.05), transparent);
            z-index: 5; pointer-events: none;
        }

        /* ================= LEFT: illustration, light ================= */
        .split-left {
            flex: 1;
            background: linear-gradient(160deg, #eef1ff 0%, #dfe4fb 55%, #e9ecfb 100%);
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 46px 44px;
            overflow: hidden;
        }
        .split-left::before {
            content: '';
            position: absolute; width: 340px; height: 340px; border-radius: 50%;
            background: rgba(37, 99, 235, 0.10);
            top: -120px; left: -100px;
        }
        .split-left::after {
            content: '';
            position: absolute; width: 230px; height: 230px; border-radius: 50%;
            background: rgba(212, 175, 55, 0.09);
            bottom: -80px; right: -60px;
        }

        .brand-row { display: flex; align-items: center; gap: 11px; position: relative; z-index: 2; }
        .brand-logo-icon {
            width: 42px; height: 42px; border-radius: 12px;
            background: linear-gradient(135deg, var(--blue-bright), var(--blue-accent));
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-size: 1.12rem;
            box-shadow: 0 8px 20px rgba(37,99,235,0.35);
        }
        .brand-name { font-weight: 800; font-size: 1.15rem; color: #10193a; letter-spacing: -0.01em; }
        .brand-name .accent { color: var(--blue-accent); }

        /* Framed illustration - the key fix. Card-like container instead of a bare image */
        .illustration-frame {
            position: relative; z-index: 2;
            flex: 1;
            display: flex; align-items: center; justify-content: center;
            margin: 28px 0;
        }
        .illustration-card {
            background: #fff;
            border-radius: 24px;
            padding: 28px;
            box-shadow:
                0 30px 60px rgba(10,24,52,0.14),
                0 2px 0 rgba(255,255,255,0.8) inset;
            border: 1px solid rgba(255,255,255,0.9);
            position: relative;
            animation: floatGentle 5s ease-in-out infinite;
        }
        .illustration-card::before {
            content: '';
            position: absolute; inset: -1px;
            border-radius: 25px;
            padding: 1px;
            background: linear-gradient(135deg, rgba(77,143,230,0.4), transparent 40%, rgba(212,175,55,0.25));
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            pointer-events: none;
        }
        .illustration-card img {
            display: block;
            width: 320px; max-width: 100%; height: auto;
            border-radius: 12px;
        }
        @keyframes floatGentle {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .left-caption { position: relative; z-index: 2; text-align: center; }
        .left-caption h3 { font-size: 1.2rem; font-weight: 800; color: #10193a; margin-bottom: 7px; letter-spacing: -0.01em; }
        .left-caption p { font-size: 0.87rem; color: #5b6382; line-height: 1.55; max-width: 330px; margin: 0 auto; }

        .trust-row { display: flex; justify-content: center; gap: 8px; margin-top: 20px; position: relative; z-index: 2; }
        .trust-chip {
            display: flex; align-items: center; gap: 5px;
            background: rgba(255,255,255,0.7);
            border: 1px solid rgba(37,99,235,0.15);
            border-radius: 20px; padding: 6px 12px;
            font-size: 0.67rem; font-weight: 700; letter-spacing: 0.02em;
            color: #3a4270;
            transition: all 0.2s ease;
            cursor: default;
        }
        .trust-chip:hover {
            background: #fff;
            border-color: rgba(37,99,235,0.35);
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(37,99,235,0.12);
        }
        .trust-chip i { color: var(--blue-accent); font-size: 0.78rem; }

        /* ================= RIGHT: dark navy vault, the form ================= */
        .split-right {
            flex: 1;
            background: linear-gradient(160deg, var(--navy-deep) 0%, var(--navy-mid) 55%, #0d2149 100%);
            background-size: 220% 220%;
            animation: gradientShift 16s ease infinite;
            position: relative;
            padding: 58px 52px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow: hidden;
        }
        @keyframes gradientShift {
            0%   { background-position: 0% 50%; }
            50%  { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .split-right .orb { position: absolute; border-radius: 50%; filter: blur(4px); pointer-events: none; }
        .orb-1 {
            width: 280px; height: 280px;
            background: radial-gradient(circle, rgba(77,143,230,0.3), transparent 70%);
            top: -110px; right: -90px;
            animation: floatSlow 10s ease-in-out infinite;
        }
        .orb-2 {
            width: 210px; height: 210px;
            background: radial-gradient(circle, rgba(212,175,55,0.15), transparent 70%);
            bottom: -90px; left: -60px;
            animation: floatSlow 13s ease-in-out infinite reverse;
        }
        @keyframes floatSlow {
            0%, 100% { transform: translate(0,0); }
            50% { transform: translate(18px,-24px); }
        }

        .grid-overlay {
            position: absolute; inset: 0;
            background-image:
                linear-gradient(rgba(255,255,255,0.025) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255,255,255,0.025) 1px, transparent 1px);
            background-size: 44px 44px;
            pointer-events: none;
        }

        .form-content { position: relative; z-index: 3; }

        .card-title-row { display: flex; align-items: center; justify-content: space-between; margin-bottom: 5px; }
        .card-title { font-size: 1.65rem; font-weight: 800; color: #fff; letter-spacing: -0.015em; }
        .live-dot-row {
            display: flex; align-items: center; gap: 6px; font-size: 0.67rem;
            color: rgba(255,255,255,0.55); font-weight: 700;
            background: rgba(52,211,153,0.1);
            border: 1px solid rgba(52,211,153,0.25);
            border-radius: 20px; padding: 4px 10px;
        }
        .live-dot { width: 6px; height: 6px; border-radius: 50%; background: #34d399; animation: livePulse 2s infinite; }
        @keyframes livePulse {
            0% { box-shadow: 0 0 0 0 rgba(52,211,153,0.55); }
            70% { box-shadow: 0 0 0 7px rgba(52,211,153,0); }
            100% { box-shadow: 0 0 0 0 rgba(52,211,153,0); }
        }
        .card-subtitle { color: rgba(255,255,255,0.5); font-size: 0.9rem; margin-bottom: 32px; }

        .float-group { position: relative; margin-bottom: 20px; }
        .float-group i.field-icon {
            position: absolute; left: 17px; top: 18px;
            color: rgba(255,255,255,0.42); font-size: 1.05rem; z-index: 3;
            transition: color 0.2s ease;
        }
        .float-input {
            width: 100%; padding: 21px 17px 9px 46px;
            border-radius: 14px; border: 1.5px solid rgba(255,255,255,0.14);
            background: rgba(255,255,255,0.08); color: #fff; font-size: 0.97rem;
            transition: all 0.2s ease; position: relative; z-index: 2;
        }
        .float-input::placeholder { color: transparent; }
        .float-input:hover { background: rgba(255,255,255,0.1); border-color: rgba(255,255,255,0.22); }
        .float-input:focus {
            outline: none; border-color: var(--blue-bright);
            background: rgba(255,255,255,0.12);
            box-shadow: 0 0 0 4px rgba(77,143,230,0.2);
        }
        .float-input:focus ~ i.field-icon { color: var(--blue-bright); }

        .float-label {
            position: absolute; left: 46px; top: 16px;
            color: rgba(255,255,255,0.45); font-size: 0.95rem;
            pointer-events: none; transition: all 0.18s ease; z-index: 3;
        }
        .float-input:focus ~ .float-label,
        .float-input:not(:placeholder-shown) ~ .float-label {
            top: 7px; font-size: 0.67rem; font-weight: 700;
            color: var(--blue-bright); letter-spacing: 0.03em;
        }

        .toggle-password {
            position: absolute; right: 17px; top: 18px;
            color: rgba(255,255,255,0.42); cursor: pointer; z-index: 3;
            font-size: 1rem; transition: color 0.15s ease;
        }
        .toggle-password:hover { color: var(--blue-bright); }

        .form-extras { display: flex; justify-content: space-between; align-items: center; margin-bottom: 28px; font-size: 0.83rem; }
        .remember-check { display: flex; align-items: center; gap: 8px; color: rgba(255,255,255,0.62); cursor: pointer; }
        .remember-check input { accent-color: var(--blue-bright); width: 16px; height: 16px; cursor: pointer; }
        .forgot-link { color: var(--blue-bright); text-decoration: none; font-weight: 600; transition: color 0.15s ease; }
        .forgot-link:hover { color: #7fb0f5; }

        .login-btn {
            width: 100%; padding: 16px; border: none; border-radius: 14px;
            background: linear-gradient(135deg, var(--blue-bright), var(--blue-accent));
            color: #fff; font-weight: 800; font-size: 1rem; letter-spacing: 0.02em;
            position: relative; overflow: hidden; cursor: pointer;
            box-shadow: 0 10px 26px rgba(37,99,235,0.35);
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }
        .login-btn:hover { transform: translateY(-2px); box-shadow: 0 18px 40px rgba(37,99,235,0.5); }
        .login-btn:active { transform: translateY(0); }
        .login-btn::before {
            content: ''; position: absolute; top: 0; left: -75%; width: 50%; height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.5), transparent);
            transform: skewX(-20deg); transition: left 0.6s ease;
        }
        .login-btn:hover::before { left: 130%; }

        .divider-row { display: flex; align-items: center; gap: 12px; margin: 24px 0 18px 0; }
        .divider-row .line { flex: 1; height: 1px; background: rgba(255,255,255,0.14); }
        .divider-row span { color: rgba(255,255,255,0.38); font-size: 0.74rem; font-weight: 700; letter-spacing: 0.04em; }

        .signup-row { text-align: center; color: rgba(255,255,255,0.55); font-size: 0.87rem; }
        .signup-row a { color: var(--blue-bright); font-weight: 700; text-decoration: none; }
        .signup-row a:hover { color: #7fb0f5; }

        @media (max-width: 900px) {
            .split-shell { flex-direction: column; max-width: 460px; min-height: 0; }
            .split-shell::before { display: none; }
            .split-left { padding: 32px 32px 24px 32px; }
            .illustration-card img { width: 220px; }
            .left-caption, .trust-row { display: none; }
            .split-right { padding: 40px 32px; }
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
    <div class="split-shell anim-in">

        <!-- Left: illustration, light -->
        <div class="split-left">
            <div class="brand-row">
                <div class="brand-logo-icon"><i class="bi bi-shield-lock-fill"></i></div>
                <div class="brand-name">AutoSoft<span class="accent">Dynamics</span></div>
            </div>

            <div class="illustration-frame">
                <div class="illustration-card">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/003/689/228/small_2x/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg"
                         alt="Secure login illustration" />
                </div>
            </div>

            <div>
                <div class="left-caption">
                    <h3>Secure access, every time</h3>
                    <p>Your credentials are protected end-to-end. Sign in to reach your ABC Bank dashboard.</p>
                </div>
                <div class="trust-row">
                    <div class="trust-chip"><i class="bi bi-lock-fill"></i>256-BIT SSL</div>
                    <div class="trust-chip"><i class="bi bi-patch-check-fill"></i>ISO 27001</div>
                </div>
            </div>
        </div>

        <!-- Right: dark navy vault, the form -->
        <div class="split-right">
            <div class="orb orb-1"></div>
            <div class="orb orb-2"></div>
            <div class="grid-overlay"></div>

            <div class="form-content">

                <div class="card-title-row">
                    <div class="card-title">Welcome back</div>
                    <div class="live-dot-row"><span class="live-dot"></span>SECURE</div>
                </div>
                <div class="card-subtitle">Sign in to access your dashboard</div>

                <div class="float-group">
                    <i class="bi bi-person-badge field-icon"></i>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="float-input" placeholder=" " />
                    <label class="float-label">Employee ID</label>
                </div>

                <div class="float-group">
                    <i class="bi bi-lock field-icon"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="float-input" TextMode="Password" placeholder=" " />
                    <label class="float-label">Password</label>
                    <i class="bi bi-eye toggle-password" id="togglePwdIcon" onclick="togglePasswordVisibility()"></i>
                </div>

                <div class="form-extras">
                    <label class="remember-check">
                        <input type="checkbox" id="chkRemember" />
                        Remember me
                    </label>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </div>

                <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="Sign In Securely" />

                <div class="divider-row">
                    <div class="line"></div>
                    <span>NEED HELP</span>
                    <div class="line"></div>
                </div>

                <div class="signup-row">
                    Trouble logging in? <a href="#">Contact support</a>
                </div>

            </div>
        </div>

    </div>
    </form>

    <script>
        function togglePasswordVisibility() {
            var pwdField = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.getElementById('togglePwdIcon');

            if (pwdField.type === 'password') {
                pwdField.type = 'text';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                pwdField.type = 'password';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }
    </script>
</body>
</html>
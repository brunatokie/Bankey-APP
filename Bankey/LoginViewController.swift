import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let titleView = UILabel()
    let subtitleView = UILabel()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()

    var username: String? {
        return loginView.usernameTextField.text
    }

    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false

        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.textAlignment = .center
        titleView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleView.adjustsFontForContentSizeCategory = true
        titleView.text = "Bankey"

        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.textAlignment = .center
        subtitleView.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleView.adjustsFontForContentSizeCategory = true
        subtitleView.numberOfLines = 0
        subtitleView.text = "Your premium source for all things banking!"
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }

    private func layout() {
        view.addSubview(loginView)
        view.addSubview(titleView)
        view.addSubview(subtitleView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        // Title
        NSLayoutConstraint.activate([
            subtitleView.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 3),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleView.bottomAnchor, multiplier: 3),
            subtitleView.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])

        // LoginView
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            subtitleView.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 3),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleView.bottomAnchor, multiplier: 3),
            subtitleView.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])

        // LoginView
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
        ])

        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])

        // Error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }

    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }

        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }

        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }

    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

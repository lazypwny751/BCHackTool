use clap::Parser;
use crate::utils::clap::{Cli, Commands};
use rust_i18n::t;
mod utils;

// The string fields are required for initialization but it can be changed in main.
rust_i18n::i18n!("locales", fallback = "en");

// Convert t to string.
pub fn t(key: &str) -> String {
    t!(key).to_string()
}

fn main() {
	// Parse parameters.
    let cli = Cli::parse();

	rust_i18n::set_locale(&cli.language);

	// Verbose mode not needed for now, but we'll use it in the future..
    if cli.verbose {
        println!("Verbose!");
    }

    match &cli.command {
        Commands::Install { package } => {
            println!("Install: {:?}", package);
        },
        Commands::Run { command } => {
            println!("Run: {}", command);
        },
        Commands::Uninstall { package } => {
            println!("Uninstall: {:?}", package);
        },
		Commands::Shell => { // <-- Might be it could be default in the future features.
			println!("{}", t("hello world"));
		},
    }
}

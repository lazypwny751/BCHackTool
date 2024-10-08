use clap::Parser;
use bclib::structs::{
	Commands,
	Cli
};

fn main() {
	// Parse parameters.
    let cli = Cli::parse();

	// Verbose mode not needed for now, but we'll use it in the future..
    if cli.verbose {
        println!("Verbose!");
    }

    match &cli.command {
        Commands::Install { package } => {
            println!("Install: {:?}", package);
        }
        Commands::Run { command } => {
            println!("Run: {}", command);
        }
        Commands::Uninstall { package } => {
            println!("Uninstall: {:?}", package);
        }
    }
}

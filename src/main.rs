use clap::{Parser, Subcommand};

#[derive(Parser, Debug)]
#[command(name = "BChackTool", version = "3.0.0", author = "Huseyin  Altintas", about = "Pentest environment helper.")]
struct Cli {
    #[arg(short, long)]
    verbose: bool,

    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug)]
enum Commands {
    Install {
        #[arg(value_name = "PACKAGE")]
        package: String,
    },

    Run {
        #[arg(value_name = "COMMAND")]
        command: String,
    },

    Uninstall {
        #[arg(value_name = "PACKAGE")]
        package: String,
    },

    Version,
}

fn main() {
    let cli = Cli::parse();

    if cli.verbose {
        println!("Verbose!");
    }

    match &cli.command {
        Commands::Install { package } => {
            println!("Install: {}", package);
        }
        Commands::Run { command } => {
            println!("Run: {}", command);
        }
        Commands::Uninstall { package } => {
            println!("Uninstall: {}", package);
        }
        Commands::Version => {
            println!("Version: 3.0");
        }
    }
}

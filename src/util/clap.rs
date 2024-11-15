use clap::{Parser, Subcommand};
use bclib::statics;

#[derive(Subcommand, Debug)]
pub enum Commands {
    Install {
        #[arg(value_name = "PACKAGE")]
        package: Vec<String>,
    },

    Run {
        #[arg(value_name = "COMMAND")]
        command: String,
    },

    Uninstall {
        #[arg(value_name = "PACKAGE")]
        package: Vec<String>,
    },

	Shell,
}

#[derive(Parser, Debug)]
#[command(name = "BChackTool", version = statics::VERSION, author = "Huseyin  Altintas", about = "ByCh4n's pentest environment, pentesting is easy now.")]
pub struct Cli {
    #[arg(short, long)]
    pub verbose: bool,

	#[arg(short, long, default_value = "en")]
	pub language: String,

    #[command(subcommand)]
    pub command: Commands,
}

<p align="center">
  <a href="https://dashboard.api-football.com/soccer">
    <img src="https://cdn4.iconfinder.com/data/icons/white-sportsman/512/sport_avatar_man_boy-01-1024.png" width="60" />
  </a>
</p>
<h1 align="center">
  Football Stats CLI with Thor
</h1>

## CLI for fetching football stats using the API-Football API

This is a CLI application that fetches football stats using the API-Football API. The CLI is built using the Thor gem.
This project was only done for learning purposes and is not intended to be used in production.

## 👨🏻‍💻 Setup

1. Create an account on the [API-Football](https://dashboard.api-football.com/) website and get your API key.
2. Place your API key in the `.env` file. Please create a `.env` file in the root directory of the project and add the following line.
```
API_KEY={YOUR_API_KEY}
```

## 🚀 Usage

Note: the CLI only have one command for now: `football_stats:top_scorers` which prints the top 10 scorers of the selected league.

```sh
$ bundle install
```

```sh
$ thor list
football_stats
--------------
thor football_stats:top_scorers -l, --league=LEAGUE  # Prints the top 10 scorers of the Ligue 1 season with their respective clubs and goals.
```

```sh
$ thor help football_stats:top_scorers
Usage:
  thor football_stats:top_scorers -l, --league=LEAGUE

Options:
  -l, --league=LEAGUE  # The league for which you want to see the top scorers. Supported leagues are: ligue-1, premier-league, bundesliga, serie-a, la-liga

Description:
  `football_stats top_scorers` will print the top 10 scorers of the Ligue 1 season with their respective clubs and goals.

  Example: $ football_stats top_scorers --league=premier-league

  Supported leagues are: ligue-1, premier-league, bundesliga, serie-a, la-liga
```

```sh
$ thor football_stats:top_scorers --league=premier-league
1. E. Haaland | Manchester City | 36 ⚽️
2. H. Kane | Tottenham | 30 ⚽️
3. I. Toney | Brentford | 20 ⚽️
4. Mohamed Salah | Liverpool | 19 ⚽️
5. C. Wilson | Newcastle | 18 ⚽️
6. M. Rashford | Manchester United | 17 ⚽️
7. M. Ødegaard | Arsenal | 15 ⚽️
8. Gabriel Martinelli | Arsenal | 15 ⚽️
9. O. Watkins | Aston Villa | 15 ⚽️
10. B. Saka | Arsenal | 14 ⚽️
```

## 📚 Learning

I discovered the Thor gem through GoRails and decided to build a CLI application using the Thor gem.
I managed to build a CLI application with a clear description of the commands and options. I tried to make the folder structure as organized as possible, separating the concerns of the application (services, models, librairies, etc.).
Thor seems like a viable option for building CLI applications in Ruby.

defmodule Oscar.Repo.Migrations.InsertCategoriesAndNominees do
  use Ecto.Migration

  alias Oscar.Categories.Category
  alias Oscar.Nominees.Nominee
  alias Oscar.Repo

  def change do
    categories_and_nominees = [
      %{
        category: %{name: "Actor in a Leading Role"},
        nominees: [
          %{subtitle: "Being the Ricardos", title: "Javier Bardem"},
          %{subtitle: "The Power of the Dog", title: "Benedict Cumberbatch"},
          %{subtitle: "tick, tick...BOOM!", title: "Andrew Garfield"},
          %{subtitle: "King Richard", title: "Will Smith"},
          %{subtitle: "The Tragedy of Macbeth", title: "Denzel Washington"}
        ]
      },
      %{
        category: %{name: "Actor in a Supporting Role"},
        nominees: [
          %{subtitle: "Belfast", title: "Ciarán Hinds"},
          %{subtitle: "CODA", title: "Troy Kotsur"},
          %{subtitle: "The Power of the Dog", title: "Jesse Plemons"},
          %{subtitle: "Being the Ricardos", title: "J.K. Simmons"},
          %{subtitle: "The Power of the Dog", title: "Kodi Smit-McPhee"}
        ]
      },
      %{
        category: %{name: "Actress in a Leading Role"},
        nominees: [
          %{subtitle: "The Eyes of Tammy Faye", title: "Jessica Chastain"},
          %{subtitle: "The Lost Daughter", title: "Olivia Colman"},
          %{subtitle: "Parallel Mothers", title: "Penélope Cruz"},
          %{subtitle: "Being the Ricardos", title: "Nicole Kidman"},
          %{subtitle: "Spencer", title: "Kristen Stewart"}
        ]
      },
      %{
        category: %{name: "Actress in a Supporting Role"},
        nominees: [
          %{subtitle: "The Lost Daughter", title: "Jessie Buckley"},
          %{subtitle: "West Side Story", title: "Ariana DeBose"},
          %{subtitle: "Belfast", title: "Judi Dench"},
          %{subtitle: "The Power of the Dog", title: "Kirsten Dunst"},
          %{subtitle: "King Richard", title: "Aunjanue Ellis"}
        ]
      },
      %{
        category: %{name: "Animated Feature Film"},
        nominees: [
          %{
            subtitle: "Jared Bush, Byron Howard, Yvett Merino and Clark Spencer",
            title: "Encanto"
          },
          %{
            subtitle:
              "Jonas Poher Rasmussen, Monica Hellström, Signe Byrge Sørensen and Charlotte De La Gournerie",
            title: "Flee"
          },
          %{subtitle: "Enrico Casarosa and Andrea Warren", title: "Luca"},
          %{
            subtitle: "Mike Rianda, Phil Lord, Christopher Miller and Kurt Albrecht",
            title: "The Mitchells vs. the Machines"
          },
          %{
            subtitle: "Don Hall, Carlos López Estrada, Osnat Shurer and Peter Del Vecho",
            title: "Raya and the Last Dragon"
          }
        ]
      },
      %{
        category: %{name: "Cinematography"},
        nominees: [
          %{subtitle: "Greig Fraser", title: "Dune"},
          %{subtitle: "Dan Laustsen", title: "Nightmare Alley"},
          %{subtitle: "Ari Wegner", title: "The Power of the Dog"},
          %{subtitle: "Bruno Delbonnel", title: "The Tragedy of Macbeth"},
          %{subtitle: "Janusz Kaminski", title: "West Side Story"}
        ]
      },
      %{
        category: %{name: "Costume Design"},
        nominees: [
          %{subtitle: "Jenny Beavan", title: "Cruella"},
          %{
            subtitle: "Massimo Cantini Parrini and Jacqueline Durran",
            title: "Cyrano"
          },
          %{subtitle: "Jacqueline West and Robert Morgan", title: "Dune"},
          %{subtitle: "Luis Sequeira", title: "Nightmare Alley"},
          %{subtitle: "Paul Tazewell", title: "West Side Story"}
        ]
      },
      %{
        category: %{name: "Directing"},
        nominees: [
          %{subtitle: "Kenneth Branagh", title: "Belfast"},
          %{subtitle: "Ryusuke Hamaguchi", title: "Drive My Car"},
          %{subtitle: "Paul Thomas Anderson", title: "Licorice Pizza"},
          %{subtitle: "Jane Campion", title: "The Power of the Dog"},
          %{subtitle: "Steven Spielberg", title: "West Side Story"}
        ]
      },
      %{
        category: %{name: "Documentary (Feature)"},
        nominees: [
          %{
            subtitle: "Jessica Kingdon, Kira Simon-Kennedy and Nathan Truesdell",
            title: "Ascension"
          },
          %{subtitle: "Stanley Nelson and Traci A. Curry", title: "Attica"},
          %{
            subtitle:
              "Jonas Poher Rasmussen, Monica Hellström, Signe Byrge Sørensen and Charlotte De La Gournerie",
            title: "Flee"
          },
          %{
            subtitle:
              "Ahmir \"Questlove\" Thompson, Joseph Patel, Robert Fyvolent and David Dinerstein",
            title: "Summer of Soul (...Or, When the Revolution Could Not Be Televised)"
          },
          %{subtitle: "Rintu Thomas and Sushmit Ghosh", title: "Writing with Fire"}
        ]
      },
      %{
        category: %{name: "Documentary (Short Subject)"},
        nominees: [
          %{subtitle: "Matt Ogens and Geoff McLean", title: "Audible"},
          %{subtitle: "Pedro Kos and Jon Shenk", title: "Lead Me Home"},
          %{subtitle: "Ben Proudfoot", title: "The Queen of Basketball"},
          %{
            subtitle: "Elizabeth Mirzaei and Gulistan Mirzaei",
            title: "Three Songs for Benazir"
          },
          %{subtitle: "Jay Rosenblatt", title: "When We Were Bullies"}
        ]
      },
      %{
        category: %{name: "Film Editing"},
        nominees: [
          %{subtitle: "Hank Corwin", title: "Don't Look Up"},
          %{subtitle: "Joe Walker", title: "Dune"},
          %{subtitle: "Pamela Martin", title: "King Richard"},
          %{subtitle: "Peter Sciberras", title: "The Power of the Dog"},
          %{
            subtitle: "Myron Kerstein and Andrew Weisblum",
            title: "tick, tick...BOOM!"
          }
        ]
      },
      %{
        category: %{name: "International Feature Film"},
        nominees: [
          %{subtitle: "Japan", title: "Drive My Car"},
          %{subtitle: "Denmark", title: "Flee"},
          %{subtitle: "Italy", title: "The Hand of God"},
          %{subtitle: "Bhutan", title: "Lunana: A Yak in the Classroom"},
          %{subtitle: "Norway", title: "The Worst Person in the World"}
        ]
      },
      %{
        category: %{name: "Makeup and Hairstyling"},
        nominees: [
          %{
            subtitle: "Mike Marino, Stacey Morris and Carla Farmer",
            title: "Coming 2 America"
          },
          %{
            subtitle: "Nadia Stacey, Naomi Donne and Julia Vernon",
            title: "Cruella"
          },
          %{subtitle: "Donald Mowat, Love Larson and Eva von Bahr", title: "Dune"},
          %{
            subtitle: "Linda Dowds, Stephanie Ingram and Justin Raleigh",
            title: "The Eyes of Tammy Faye"
          },
          %{
            subtitle: "Göran Lundström, Anna Carin Lock and Frederic Aspiras",
            title: "House of Gucci"
          }
        ]
      },
      %{
        category: %{name: "Music (Original Score)"},
        nominees: [
          %{subtitle: "Nicholas Britell", title: "Don't Look Up"},
          %{subtitle: "Hans Zimmer", title: "Dune"},
          %{subtitle: "Germaine Franco", title: "Encanto"},
          %{subtitle: "Alberto Iglesias", title: "Parallel Mothers"},
          %{subtitle: "Jonny Greenwood", title: "The Power of the Dog"}
        ]
      },
      %{
        category: %{name: "Music (Original Song)"},
        nominees: [
          %{
            subtitle: "from King Richard; Music and Lyric by DIXSON and Beyoncé Knowles-Carter",
            title: "Be Alive"
          },
          %{
            subtitle: "from Encanto; Music and Lyric by Lin-Manuel Miranda",
            title: "Dos Oruguitas"
          },
          %{
            subtitle: "from Belfast; Music and Lyric by Van Morrison",
            title: "Down To Joy"
          },
          %{
            subtitle:
              "from No Time to Die; Music and Lyric by Billie Eilish and Finneas O'Connell",
            title: "No Time To Die"
          },
          %{
            subtitle: "from Four Good Days; Music and Lyric by Diane Warren",
            title: "Somehow You Do"
          }
        ]
      },
      %{
        category: %{name: "Best Picture"},
        nominees: [
          %{
            subtitle: "Laura Berwick, Kenneth Branagh, Becca Kovacik and Tamar Thomas, Producers",
            title: "Belfast"
          },
          %{
            subtitle: "Philippe Rousselet, Fabrice Gianfermi and Patrick Wachsberger, Producers",
            title: "CODA"
          },
          %{
            subtitle: "Adam McKay and Kevin Messick, Producers",
            title: "Don't Look Up"
          },
          %{subtitle: "Teruhisa Yamamoto, Producer", title: "Drive My Car"},
          %{
            subtitle: "Mary Parent, Denis Villeneuve and Cale Boyter, Producers",
            title: "Dune"
          },
          %{
            subtitle: "Tim White, Trevor White and Will Smith, Producers",
            title: "King Richard"
          },
          %{
            subtitle: "Sara Murphy, Adam Somner and Paul Thomas Anderson, Producers",
            title: "Licorice Pizza"
          },
          %{
            subtitle: "Guillermo del Toro, J. Miles Dale and Bradley Cooper, Producers",
            title: "Nightmare Alley"
          },
          %{
            subtitle:
              "Jane Campion, Tanya Seghatchian, Emile Sherman, Iain Canning and Roger Frappier, Producers",
            title: "The Power of the Dog"
          },
          %{
            subtitle: "Steven Spielberg and Kristie Macosko Krieger, Producers",
            title: "West Side Story"
          }
        ]
      },
      %{
        category: %{name: "Production Design"},
        nominees: [
          %{
            subtitle: "Production Design: Patrice Vermette; Set Decoration: Zsuzsanna Sipos",
            title: "Dune"
          },
          %{
            subtitle: "Production Design: Tamara Deverell; Set Decoration: Shane Vieau",
            title: "Nightmare Alley"
          },
          %{
            subtitle: "Production Design: Grant Major; Set Decoration: Amber Richards",
            title: "The Power of the Dog"
          },
          %{
            subtitle: "Production Design: Stefan Dechant; Set Decoration: Nancy Haigh",
            title: "The Tragedy of Macbeth"
          },
          %{
            subtitle: "Production Design: Adam Stockhausen; Set Decoration: Rena DeAngelo",
            title: "West Side Story"
          }
        ]
      },
      %{
        category: %{name: "Short Film (Animated)"},
        nominees: [
          %{subtitle: "Joanna Quinn and Les Mills", title: "Affairs of the Art"},
          %{subtitle: "Hugo Covarrubias and Tevo Díaz", title: "Bestia"},
          %{subtitle: "Anton Dyakov", title: "Boxballet"},
          %{subtitle: "Dan Ojari and Mikey Please", title: "Robin Robin"},
          %{
            subtitle: "Alberto Mielgo and Leo Sanchez",
            title: "The Windshield Wiper"
          }
        ]
      },
      %{
        category: %{name: "Short Film (Live Action)"},
        nominees: [
          %{
            subtitle: "Maria Brendle and Nadine Lüchinger",
            title: "Ala Kachuu - Take and Run"
          },
          %{subtitle: "Tadeusz Łysiak and Maciej Ślesicki", title: "The Dress"},
          %{subtitle: "Aneil Karia and Riz Ahmed", title: "The Long Goodbye"},
          %{
            subtitle: "Martin Strange-Hansen and Kim Magnusson",
            title: "On My Mind"
          },
          %{subtitle: "K.D. Dávila and Levin Menekse", title: "Please Hold"}
        ]
      },
      %{
        category: %{name: "Sound"},
        nominees: [
          %{
            subtitle: "Denise Yarde, Simon Chase, James Mather and Niv Adiri",
            title: "Belfast"
          },
          %{
            subtitle: "Mac Ruth, Mark Mangini, Theo Green, Doug Hemphill and Ron Bartlett",
            title: "Dune"
          },
          %{
            subtitle: "Simon Hayes, Oliver Tarney, James Harrison, Paul Massey and Mark Taylor",
            title: "No Time to Die"
          },
          %{
            subtitle: "Richard Flynn, Robert Mackenzie and Tara Webb",
            title: "The Power of the Dog"
          },
          %{
            subtitle:
              "Tod A. Maitland, Gary Rydstrom, Brian Chumney, Andy Nelson and Shawn Murphy",
            title: "West Side Story"
          }
        ]
      },
      %{
        category: %{name: "Visual Effects"},
        nominees: [
          %{
            subtitle: "Paul Lambert, Tristan Myles, Brian Connor and Gerd Nefzer",
            title: "Dune"
          },
          %{
            subtitle: "Swen Gillberg, Bryan Grill, Nikos Kalaitzidis and Dan Sudick",
            title: "Free Guy"
          },
          %{
            subtitle: "Charlie Noble, Joel Green, Jonathan Fawkner and Chris Corbould",
            title: "No Time to Die"
          },
          %{
            subtitle: "Christopher Townsend, Joe Farrell, Sean Noel Walker and Dan Oliver",
            title: "Shang-Chi and the Legend of the Ten Rings"
          },
          %{
            subtitle: "Kelly Port, Chris Waegner, Scott Edelstein and Dan Sudick",
            title: "Spider-Man: No Way Home"
          }
        ]
      },
      %{
        category: %{name: "Writing (Adapted Screenplay)"},
        nominees: [
          %{subtitle: "Screenplay by Siân Heder", title: "CODA"},
          %{
            subtitle: "Screenplay by Ryusuke Hamaguchi, Takamasa Oe",
            title: "Drive My Car"
          },
          %{
            subtitle: "Screenplay by Jon Spaihts and Denis Villeneuve and Eric Roth",
            title: "Dune"
          },
          %{subtitle: "Written by Maggie Gyllenhaal", title: "The Lost Daughter"},
          %{subtitle: "Written by Jane Campion", title: "The Power of the Dog"}
        ]
      },
      %{
        category: %{name: "Writing (Original Screenplay)"},
        nominees: [
          %{subtitle: "Written by Kenneth Branagh", title: "Belfast"},
          %{
            subtitle: "Screenplay by Adam McKay; Story by Adam McKay & David Sirota",
            title: "Don't Look Up"
          },
          %{subtitle: "Written by Zach Baylin", title: "King Richard"},
          %{subtitle: "Written by Paul Thomas Anderson", title: "Licorice Pizza"},
          %{
            subtitle: "Written by Eskil Vogt, Joachim Trier",
            title: "The Worst Person in the World"
          }
        ]
      }
    ]

    Enum.each(categories_and_nominees, &create_category_and_nominee/1)
  end

  defp create_category(category) do
    model = %Category{}
    changeset = Category.changeset(model, category)

    {:ok, category_inserted} = Repo.insert(changeset)

    category_inserted
  end

  defp create_nominees(category, nominees) do
    IO.inspect(category.id)
    model = %Nominee{}

    Enum.each(nominees, fn nominee ->
      data = %Nominee{
        title: nominee.title,
        subtitle: nominee.subtitle,
        category_id: category.id
      }

      IO.inspect(data, label: "DEBUG")

      {:ok, nominee_inserted} = Repo.insert(data)
    end)
  end

  defp create_category_and_nominee(data) do
    category = create_category(data.category)
    create_nominees(category, data.nominees)
  end
end

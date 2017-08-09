using System;
using TechTalk.SpecFlow;
using System.Collections.Generic;
using System.IO;
using FluentAssertions;
using NUnit.Framework;

namespace Boggle
{
    [Binding]
    public class BoggleSteps
    {
        IBoggleGame game = new BoggleGame();

        [Given(@"a scoring table that looks like:")]
        public void GivenAScoringTableThatLooksLike(Table table)
        {
           Dictionary<int, int> scoreTable = new Dictionary<int, int>();
           foreach (var row in table.Rows)
            {
                scoreTable.Add(Int32.Parse(row["WordLength"]), Int32.Parse(row["Score"]));
            }
            game.ScoringTable = scoreTable;
        }

        [Given(@"a valid word list at ""(.*)""")]
        public void GivenAValidWordListAt(string fileName)
        {
            String filePath = Path.Combine(TestContext.CurrentContext.TestDirectory, fileName);
            ISet <String> words =new HashSet<String>(File.ReadAllLines(filePath));
            game.ValidWordList = words;
        }


        [Given(@"a boggle grid that looks like:")]
        public void GivenABoggleGridThatLooksLike(string grid)
        {
            game.BoggleGrid = grid;
        }
        
        [When(@"a user enters the word ""(.*)""")]
        public void WhenAUserEntersTheWord(string word)
        {
            game.PlayWord(word);
        }

        [When(@"a user enters the words:")]
        public void WhenAUserEntersTheWords(Table table)
        {
            foreach (var row in table.Rows)
            {
                game.PlayWord(row["Word"]);
            }
        }


        [Then(@"they score (.*)")]
        public void ThenTheyScore(int expectedScore)
        {
            game.CurrentScore.Should().Be(expectedScore);
        }
    }
}

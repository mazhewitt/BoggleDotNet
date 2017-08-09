using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Boggle
{
    class BoggleGame : IBoggleGame
    {
        public IDictionary<int, int> ScoringTable { get; set; }
        public ISet<string> ValidWordList { get; set; }
        public string BoggleGrid { get; set; }

        public int CurrentScore => throw new NotImplementedException();

        public void PlayWord(string word)
        {
            throw new NotImplementedException();
        }
    }
}

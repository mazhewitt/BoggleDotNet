using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Boggle
{
    interface IBoggleGame {

         IDictionary<int, int>  ScoringTable { get; set; }
         ISet<String> ValidWordList { get; set; }
         String BoggleGrid { get; set; }       
         int CurrentScore { get; }
         void PlayWord(String word);
    }
}

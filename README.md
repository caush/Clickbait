# Variations Around the Clickbait Challenge

As we work on clickbait issues using [Huggingface Transformers](https://huggingface.co/), we found the [clickbait challenge](https://webis.de/events/clickbait-challenge/index.html) and decided to make a try.

Description of the challenge can be found in the [Webis.de](https://webis.de/events/clickbait-challenge/index.html) website. There is also a [Github page for the challenge](https://github.com/clickbait-challenge). Here is a synopsis of the challenge from the [Webis.de](https://webis.de/events/clickbait-challenge/index.html) website: 

	Clickbait refers to a certain kind of web content advertisement that is designed to entice its readers into clicking an accompanying link. Typically, it is spread on social media in the form of short teaser messages that may read like the following examples:

	- A Man Falls Down And Cries For Help Twice. The Second Time, My Jaw Drops
	- 9 Out Of 10 Americans Are Completely Wrong About This Mind-Blowing Fact
	- Here’s What Actually Reduces Gun Violence

 	When reading such and similar messages, many get the distinct impression that something is odd about them; something unnamed is referred to, some emotional reaction is promised, some lack of knowledge is ascribed, some authority is claimed. Content publishers of all kinds discovered clickbait as an effective tool to draw attention to their websites. The level of attention captured by a website determines the price of displaying ads there, whereas attention is measured in terms of unique page impressions, usually caused by clicking on a link that points to a given page (often abbreviated as “clicks”). Therefore, a clickbait’s target link alongside its teaser message usually redirects to the sender’s website if the reader is afar, or else to another page on the same site. The content found at the linked page often encourages the reader to share it, suggesting clickbait for a default message and thus spreading it virally. Clickbait on social media has been on the rise in recent years, and even some news publishers have adopted this technique.

	The task of the challenge is to develop a algorithm that rates how click baiting a social media post is.

## Data/Clickbait17
Data for the challenge can be found in the [zenado.org](https://zenodo.org) website:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5530410.svg)](https://doi.org/10.5281/zenodo.5530410)

### Original
	The Clickbait 2017 challenge corpus comprises a total of 38,517 Twitter posts from 27 major US news publishers. In addition to the posts, information about the articles linked in the posts are included. All posts were annotated on a 4-point scale [not click baiting (0.0), slightly click baiting (0.33), considerably click baiting (0.66), heavily click baiting (1.0)] by five annotators from Amazon Mechanical Turk. A total of 9,276 posts are considered clickbait by the majority of annotators.

For the challenge the corpus was divided into a training and a "secret" test dataset. After the challenge another training set was provided in the [zenado.org](https://zenodo.org) website, and the test set was not secret anymore. The set are composed of a instance.jsonl and a truth.jsonl files. The structure of the instances.jsonl files is the following :

	{
 	"id": "608999590243741697",
 	"postTimestamp": "Thu Jun 11 14:09:51 +0000 2015",
 	"postText": ["Some people are such food snobs"],
 	"postMedia": ["608999590243741697.png"],
 	"targetTitle": "Some people are such food snobs",
 	"targetDescription": "You'll never guess one...",
 	"targetKeywords": "food, foodfront, food waste...",
 	"targetParagraphs": [
   		"What a drag it is, eating kale that isn't ...",
   		"A new study, published this Wednesday by ...", 
   		...],
 	"targetCaptions": ["(Flikr/USDA)"]
 	}

The posts in the training and test sets have been judged on a 4-point scale (0, 0.3, 0.66, 1) by at least five annotators, and the structure of the truth.jsonl files is the followinf:
	
	{
	"id": "608999590243741697", 
   	"truthJudgments": [0.33, 1.0, 1.0, 0.66, 0.33],
   	"truthMean"  : 0.6666667,
   	"truthMedian": 0.6666667,
   	"truthMode"  : 1.0,
   	"truthClass" : "clickbait"
	}

For the sake of simplicity, a version of the sets is provided in the Data/Clickbait17/Original folders.

#### clickbait17-train-170630
We extract the [instances.jsonl](Data/Original/clickbait17-train-170630/instances.jsonl) file from the "clickbait17-train-170630.zip" file. There are 19538 entries. We do not keep the media files.

Note that some of the entries do not have postText. We will remove them for training.

We extract the [truth.jsonl](Data/Original/clickbait17-train-170630/truth.jsonl) file from the "clickbait17-train-170630.zip" file. There are 19538 entries. From these entries, 4761 are clickbait (`truthClass == "clickbait"` or `truthMean > 0.5`).

#### clickbait17-train-170331


#### clickbait17-test-170720
We use the test files with parsimony (in fact 1 time) to not overfit the models.

We extract the [instances.jsonl](Data/Original/clickbait17-test-170720/instances.jsonl) file from the "clickbait17-test-170720.zip" file. There are 19538 entries. We do not keep the media files. Note that some of the entries don't have postText. We will remove them for the testing.

We extract the [truth.jsonl](Data/Original/clickbait17-test-170720/truth.jsonl) file from the "clickbait17-test-170720.zip" file. There are 18979 entries. From these entries, 4515 are clickbait (`truthClass == "clickbait"` or `truthMean > 0.5`).

## Results (Clickbait)
	As primary evaluation metric, Mean Squared Error (MSE) with respect to the mean judgments of the annotators is used. Further evaluation metrics such as the F1-Score (F1) are computed with respect to the truth class, as well as the runtime of the classification software.

	The following list presents the current performances achieved by the participants. As primary evaluation measure, Mean Squared Error (MSE) with respect to the mean judgments of the annotators is used. 

	| team 			| MSE 	| F1	| Precision | Recall| Accuracy| Runtime |
	|----- 			|-----	|---	|-----------|-------|---------|-------- |
	|goldfish 	 	| 0.024 | 0.741	| 	0.739 	| 0.742 |	0.876 |	16:20:21|
	|monkfish 	 	| 0.026 | 0.694 |	0.785 	| 0.622 |	0.870 |	03:41:35|
	|dartfish 	 	| 0.027 | 0.706 |	0.733 	| 0.681 |	0.865 |	00:47:07|
	|torpedo19   	| 0.03  | 0.677 |	0.755 	| 0.614 |	0.861 |	00:52:44|
	|albacore    	| 0.031 | 0.67  | 	0.731 	| 0.62  |	0.855 |	00:01:10|
	|blobfish  	 	| 0.032 | 0.646 |	0.738 	| 0.574 |	0.85  |	00:03:22|
	|zingel 	 	| 0.033 | 0.683 |	0.719   | 0.65  |	0.856 |	00:03:27|
	|anchovy 	 	| 0.034 | 0.68  | 	0.717 	| 0.645 |	0.855 |	00:07:20|
	|ray 		 	| 0.034 | 0.684 |	0.691 	| 0.677 |	0.851 |	00:29:28|
	|icarfish 	 	| 0.035 | 0.621 |	0.768 	| 0.522 |	0.849 |	01:02:57|
	|emperor 	 	| 0.036 | 0.641 |	0.714 	| 0.581 |	0.845 |	00:04:03|
	|carpetshark 	| 0.036 | 0.638 |	0.728 	| 0.568 |	0.847 |	00:08:05|
	|electriceel 	| 0.038 | 0.588 |	0.727 	| 0.493 |	0.835 |	01:04:54|
	|arowana 	 	| 0.039 | 0.656 |	0.659 	| 0.654 |	0.837 |	00:35:24|
	|pineapplefish 	| 0.041 | 0.631 |	0.642 	| 0.621 |	0.827 |	00:54:28|
	|whitebait 	 	| 0.043 | 0.565 |	0.7 	| 0.474 |	0.826 |	00:04:31|

### OriginalToCurated
The [OriginalToCurated.ipynb](OriginalToCurated.ipynb) notebook transforms original data into one curated dataset.

### CuratedToModel
The [CuratedToModel.ipynb](CuratedToModel.ipynb) notebook takes the curated dataset to train differents models.

Models are saved in the "Caush" folder and in an [Huggingface folder](https://huggingface.co/caush).

### Caush


### Huggingface model

## Publications
From the [Webis.de](https://webis.de/events/clickbait-challenge/index.html) site. In last publication, authors use similar methods that ours (but two years before). We do not read the other publications :-( .

- Matthias Hagen, Maik Fröbe, Artur Jurk, and Martin Potthast. [Clickbait Spoiling via Question Answering and Passage Retrieval](https://webis.de/downloads/publications/papers/hagen_2022a.pdf). In 60th Annual Meeting of the Association for Computational Linguistics (ACL 2022), May 2022. Association for Computational Linguistics.

 - Lidor Ivan, Shira Dvir Gvirsman, Mario Haim, and Martin Potthast. [Don't Take the Bait: Users' Engagement with Clickbait and Its Effect on Editorial Considerations](https://webis.de/downloads/publications/papers/ivan_2021.pdf). In 71st Annual International Communication Association Conference (ICA 2021), May 2021.

 - Martin Potthast, Tim Gollub, Matthias Hagen, and Benno Stein. [The Clickbait Challenge 2017: Towards a Regression Model for Clickbait Strength](https://webis.de/downloads/publications/papers/potthast_2018w.pdf). CoRR, abs/1812.10847, December 2018.

 - Martin Potthast, Tim Gollub, Kristof Komlossy, Sebastian Schuster, Matti Wiegmann, Erika Patricia Garces Fernandez, Matthias Hagen, and Benno Stein. [Crowdsourcing a Large Corpus of Clickbait on Twitter](https://webis.de/downloads/publications/papers/potthast_2018j.pdf). In Emily M. Bender, Leon Derczynski, and Pierre Isabelle, editors, 27th International Conference on Computational Linguistics (COLING 2018), pages 1498-1507, August 2018. The COLING 2018 Organizing Committee.

 - Jiani Qu, Anny Marleen Hißbach, Tim Gollub, and Martin Potthast. [Towards Crowdsourcing Clickbait Labels for YouTube Videos](https://webis.de/downloads/publications/papers/qu_2018.pdf). In Yiling Chen and Gabrielle Kazai, editors, 6th AAAI Conference on Human Computation and Crowdsourcing (HCOMP 2018), July 2018.

 - Matti Wiegmann, Michael Völske, Benno Stein, Matthias Hagen, and Martin Potthast. [Heuristic Feature Selection for Clickbait Detection](https://webis.de/downloads/publications/papers/wiegmann_2018.pdf). CoRR, abs/1802.01191, February 2018.

 - Martin Potthast, Sebastian Köpsel, Benno Stein, and Matthias Hagen. [Clickbait Detection](https://webis.de/downloads/publications/papers/potthast_2016b.pdf). In Nicola Ferro et al., editors, Advances in Information Retrieval. 38th European Conference on IR Research (ECIR 2016), volume 9626 of Lecture Notes in Computer Science, pages 810-817, March 2016. Springer.

 - Indurthi Vijayasaradhi, Syed Bakhtiyar, Gupta Manish, Varma Vasudeva. [Predicting Clickbait Strength in Online Social Media](https://www.researchgate.net/publication/348342948_Predicting_Clickbait_Strength_in_Online_Social_Media). 4835-4846. 10.18653/v1/2020.coling-main.425 (2020).


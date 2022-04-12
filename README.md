# Clickbait
Variations around the Clickbait Challenge

Information for the challenge can be find (avril 2022) here : https://webis.de/events/clickbait-challenge/index.html .

## Synopsis from the page

Clickbait refers to a certain kind of web content advertisement that is designed to entice its readers into clicking an accompanying link. Typically, it is spread on social media in the form of short teaser messages that may read like the following examples:

 - A Man Falls Down And Cries For Help Twice. The Second Time, My Jaw Drops
 - 9 Out Of 10 Americans Are Completely Wrong About This Mind-Blowing Fact
 - Here’s What Actually Reduces Gun Violence

When reading such and similar messages, many get the distinct impression that something is odd about them; something unnamed is referred to, some emotional reaction is promised, some lack of knowledge is ascribed, some authority is claimed. Content publishers of all kinds discovered clickbait as an effective tool to draw attention to their websites. The level of attention captured by a website determines the prize of displaying ads there, whereas attention is measured in terms of unique page impressions, usually caused by clicking on a link that points to a given page (often abbreviated as “clicks”). Therefore, a clickbait’s target link alongside its teaser message usually redirects to the sender’s website if the reader is afar, or else to another page on the same site. The content found at the linked page often encourages the reader to share it, suggesting clickbait for a default message and thus spreading it virally. Clickbait on social media has been on the rise in recent years, and even some news publishers have adopted this technique. These developments have caused general concern among many outspoken bloggers, since clickbait threatens to clog up social media channels, and since it violates journalistic codes of ethics.

## Github for the challenge
Here is a the Github "page" for the challenge : https://github.com/clickbait-challenge .

### An article on the subject
Predicting Clickbait Strength in Online Social Media
https://www.researchgate.net/publication/348342948_Predicting_Clickbait_Strength_in_Online_Social_Media
Vijayasaradhi Indurthi, Bakhtiyar Syed, Manish Gupta, Vasudeva Varma
IIIT Hyderabad, India
{vijaya.saradhi,syed.b}@research.iiit.ac.in
{manish.gupta,vv}@iiit.ac.in

## Task

We invite you to participate in our ongoing challenge on the detection of clickbait posts in social media.

The task of the challenge is to develop a classifier that rates how click baiting a social media post is. For each social media post, the content of the post itself as well as the main content of the linked target web page are provided as JSON-Objects in our Datasets.

##Data
###Dataset

The Webis Clickbait Corpus 2017 comprises a total of 38,517 Twitter posts from 27 major US news publishers. In addition to the posts, information about the articles linked in the posts are included. The posts had been published between November 2016 and June 2017. To avoid publisher and topical biases, a maximum of ten posts per day and publisher were sampled. All posts were annotated on a 4-point scale [not click baiting (0.0), slightly click baiting (0.33), considerably click baiting (0.66), heavily click baiting (1.0)] by five annotators from Amazon Mechanical Turk. A total of 9,276 posts are considered clickbait by the majority of annotators. In terms of its size, this corpus outranges the Webis Clickbait Corpus 2016 by one order of magnitude. The corpus is divided into two logical parts, a training and a test dataset.

The dataset itself is hosted on Zenodo.
Input Format

Every data point consists of a JSON-object that looks like this:
	
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
	
	

## Output Format

Classifiers have to output a clickbait score in the range [0,1], where a value of 1.0 denotes that a post is heavily click baiting.

	
      	{"id": "608999590243741697", "clickbaitScore": 1.0}
        
        

#Evaluation
##Crowdsourcing

Performance is measured against a crowd-sourced test set. The posts in the training and test sets have been judged on a 4-point scale [0, 0.3, 0.66, 1] by at least five annotators.

	
	{
	"id": "608999590243741697", 
   	"truthJudgments": [0.33, 1.0, 1.0, 0.66, 0.33],
   	"truthMean"  : 0.6666667,
   	"truthMedian": 0.6666667,
   	"truthMode"  : 1.0,
   	"truthClass" : "clickbait"
	}
        
	

##Software Evaluation
As primary evaluation metric, Mean Squared Error (MSE) with respect to the mean judgments of the annotators is used. For informational purposes, we compute further evaluation metrics such as the Median Absolute Error (MedAE), the F1-Score (F1) with respect to the truth class, as well as the runtime of the classification software. For your convenience, you can download the official python evaluation program.
Software Submission

We use the Evaluation as a Service platform TIRA to evaluate the performance of your classifier. TIRA requires that you deploy your classifier as a program that can be executed with two arguments for input and output directories via a command line call.

    1. Use our paper template to outline your approach and elaborate on its variants.
    2. Develop and train a clickbait classifier on the training data.
    3. Deploy the trained classifier on the TIRA virtual machine assigned to you.
    4. Use tira.io to self-evaluate the deployed classifier on the test set by running an evaluator on the output of your run.

## Results

The following list presents the current performances achieved by the participants. As primary evaluation measure, Mean Squared Error (MSE) with respect to the mean judgments of the annotators is used. For further metrics, see the full result table on tira.io. If provided, paper and code of the submissions are linked in each row.
team 	results
	MSE 	F1 	Precision 	Recall 	Accuracy 	Runtime 	Code/Paper
goldfish 	0.024 	0.741 	0.739 	0.742 	0.876 	16:20:21 	Code/Paper
monkfish 	0.026 	0.694 	0.785 	0.622 	0.870 	03:41:35 	Code/Paper
dartfish 	0.027 	0.706 	0.733 	0.681 	0.865 	00:47:07 	Code/Paper
torpedo19 	0.03 	0.677 	0.755 	0.614 	0.861 	00:52:44 	Code/Paper
albacore 	0.031 	0.67 	0.731 	0.62 	0.855 	00:01:10 	Code/Paper
blobfish 	0.032 	0.646 	0.738 	0.574 	0.85 	00:03:22 	Code/Paper
zingel 	0.033 	0.683 	0.719 	0.65 	0.856 	00:03:27 	Code/Paper
anchovy 	0.034 	0.68 	0.717 	0.645 	0.855 	00:07:20 	Code/Paper
ray 	0.034 	0.684 	0.691 	0.677 	0.851 	00:29:28 	Code/Paper
icarfish 	0.035 	0.621 	0.768 	0.522 	0.849 	01:02:57 	Code/Paper
emperor 	0.036 	0.641 	0.714 	0.581 	0.845 	00:04:03 	Code/Paper
carpetshark 	0.036 	0.638 	0.728 	0.568 	0.847 	00:08:05 	Code/Paper
electriceel 	0.038 	0.588 	0.727 	0.493 	0.835 	01:04:54 	Code/Paper
arowana 	0.039 	0.656 	0.659 	0.654 	0.837 	00:35:24 	Code/Paper
pineapplefish 	0.041 	0.631 	0.642 	0.621 	0.827 	00:54:28 	Code/Paper
whitebait 	0.043 	0.565 	0.7 	0.474 	0.826 	00:04:31 	Code/Paper
clickbait17-baseline 	0.043 	0.552 	0.758 	0.434 	0.832 	00:37:34 	Code/Paper


## Related Work

    Clickbait tweets typically aim to exploit the "curiosity gap", providing just enough information to make readers curious, but not enough to satisfy their curiosity without clicking through to the linked content.
    Wikipedia contributors. Clickbait. In Wikipedia, The Free Encyclopedia. Retrieved 2017

    A tweet is Clickbait if (1) the tweet withholds information required to understand what the content of the article is; and if (2) the tweet exaggerates the article to create misleading expectations for the reader.
    Alex Peysakhovich and Kristin Hendrix. News Feed FYI: Further Reducing Clickbait in Feed. In Facebook newsroom, August, 2016.

    Clickbait is saying "this town" or "this state" or "this celebrity" instead of saying Los Angeles or Colorado or Justin Timberlake. It's over-promising and under-delivering. It's leaving out the one crucial piece of information the reader may want to know.
    Ricardo Bilton. The many different ways publishers define 'clickbait'. In digiday UK, November, 2014.

    This paper presents the first machine learning approach to clickbait detection: the goal is to identify messages in a social stream that are designed to exploit cognitive biases to increase the likelihood of readers clicking an accompanying link.
    Martin Potthast, Sebastian Köpsel, Benno Stein, and Matthias Hagen. Clickbait Detection. In Advances in Information Retrieval (ECIR 16), March 2016.

## Publications
Matthias Hagen, Maik Fröbe, Artur Jurk, and Martin Potthast. Clickbait Spoiling via Question Answering and Passage Retrieval. In 60th Annual Meeting of the Association for Computational Linguistics (ACL 2022), May 2022. Association for Computational Linguistics. [arxiv] [bib] [code] [copylink] [data]
Lidor Ivan, Shira Dvir Gvirsman, Mario Haim, and Martin Potthast. Don't Take the Bait: Users' Engagement with Clickbait and Its Effect on Editorial Considerations. In 71st Annual International Communication Association Conference (ICA 2021), May 2021. [bib] [copylink] [video]
Martin Potthast, Tim Gollub, Matthias Hagen, and Benno Stein. The Clickbait Challenge 2017: Towards a Regression Model for Clickbait Strength. CoRR, abs/1812.10847, December 2018. [bib] [copylink] [event] [publisher] [research]
Martin Potthast, Tim Gollub, Kristof Komlossy, Sebastian Schuster, Matti Wiegmann, Erika Patricia Garces Fernandez, Matthias Hagen, and Benno Stein. Crowdsourcing a Large Corpus of Clickbait on Twitter. In Emily M. Bender, Leon Derczynski, and Pierre Isabelle, editors, 27th International Conference on Computational Linguistics (COLING 2018), pages 1498-1507, August 2018. The COLING 2018 Organizing Committee. [bib] [copylink] [data] [publisher] [research]
Jiani Qu, Anny Marleen Hißbach, Tim Gollub, and Martin Potthast. Towards Crowdsourcing Clickbait Labels for YouTube Videos. In Yiling Chen and Gabrielle Kazai, editors, 6th AAAI Conference on Human Computation and Crowdsourcing (HCOMP 2018), July 2018. [bib] [copylink] [data] [research]
Matti Wiegmann, Michael Völske, Benno Stein, Matthias Hagen, and Martin Potthast. Heuristic Feature Selection for Clickbait Detection. CoRR, abs/1802.01191, February 2018. [bib] [copylink] [publisher]
Martin Potthast, Sebastian Köpsel, Benno Stein, and Matthias Hagen. Clickbait Detection. In Nicola Ferro et al., editors, Advances in Information Retrieval. 38th European Conference on IR Research (ECIR 2016), volume 9626 of Lecture Notes in Computer Science, pages 810-817, March 2016. Springer. [award] [bib] [copylink] [data] [doi] [poster] [research] [slides]

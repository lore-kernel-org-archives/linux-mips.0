Date: Wed,  6 Apr 2005 15:26:19 +0100
Message-ID: <IEJ43V$0C5BA57403CC7EFC09D35453D3E9129E@scarlet.be>
Subject: Re:cross compiling
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
From: "Philippe De Swert" <philippedeswert@scarlet.be>
Return-Path: <philippedeswert@scarlet.be>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "b.srinivas" <b.srinivas@conexant.com>
Cc: linux-mips <linux-mips@linux-mips.org>
Message-ID: <20050406142619.FopS7kEv6DumLLusiF8HK1LLW6PHTIfFl5RsAyxdExw@z>

Hello,


>      Iam trying to set up a cross compiler tool chain for mips 64 bit
> big endian.
> 
> Iam fixed in a chicken-egg kind of situation ......  during the
> compilation the linker doesn't find the crti.o which is built using the
> glibc but I still don't have glibc which need the compiler !!!. can
> anybody point me to a solution.

As you seem quite unexperienced I would recommend using Dan Kegel's crosstool
at www.kegel.com/crosstool. And if you really need help after trying that or
reading up on resources, we will need a more detailed description of your
problem. Error output, versions, procedure you are using, etc....

You do realize that the --without-headers option is broken from gcc-3.2.x
onwards....?

regards,

Philippe 
 
| Philippe De Swert       
|      
| Stag developer http://stag.mind.be/  
| Emdebian developer: http://www.emdebian.org  
|   
| Please do not send me documents in a closed 
| format.(*.doc,*.xls,*.ppt)    
| Use the open alternatives. (*.pdf,*.ps,*.html,*.txt)    
| http://www.gnu.org/philosophy/no-word-attachments.html  

-------------------------------------------------------
NOTE! My email address is changing to ... @scarlet.be
Please make the necessary changes in your address book. 

Subject: Re: MIPS gas problem
In-Reply-To: <20000421154859.3820.qmail@daffy.airs.com>
References: <20000420164812.17210.qmail@daffy.airs.com>
	<20000421123014J.machida@sm.sony.co.jp>
	<20000421154859.3820.qmail@daffy.airs.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <20000424121651S.machida@sm.sony.co.jp>
Date: Mon, 24 Apr 2000 12:16:51 +0900
From: Hiroyuki Machida <machida@sm.sony.co.jp>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
Cc: linux@cthulhu.engr.sgi.com, debian-mips@lists.debian.org
Message-ID: <20000424031651.JPEuzVb0Bwk6rWVTeHLuhTelvCUf4f1wGHutoVJnBfw@z>


Thank you Ian and Alan.

From: Ian Lance Taylor <ian@zembu.com>
Subject: Re: MIPS gas problem
Date: 21 Apr 2000 08:48:59 -0700

>    Date: Fri, 21 Apr 2000 12:30:14 +0900
>    From: Hiroyuki Machida <machida@sm.sony.co.jp>
> 
>    This message is a gcc issue, as you said. 
> 
>    But, my reported plobelm is really binutils issue.
> 
> I know.  I didn't mean to imply otherwise.  Alan Modra's suggested
> patch was the right one.
> 
> Ian

I summarize the problem and attach patch. Please install it, if you
can. I don't know what procedure is required to install the patch to
CVS tree. 

*Problem Description:
Current tc-mips.c:s_change_sec() always sets '.rdata' and '.sdata'
section alignments to 2**4, even if those contain over 2**4 aligned 
objects.


*Solution:
Tc-mips.c:s_change_sec() should use record_alignment(), not
bfd_set_section_alignment(), for preventing  reset section
alignments.


*Patch:

2000-04-24	Machida Hiroyuki <machida@sm.sony.co.jp>

tc-mips.c (s_change_sec): Use record_alignment(), not 
  bfd_set_section_alignment() to preserve section aligenments. 


--- tc-mips.c.ORG	Mon Apr 24 11:22:39 2000
+++ tc-mips.c	Mon Apr 24 11:24:48 2000
@@ -10045,7 +10045,7 @@ s_change_sec (sec)
 				      | SEC_RELOC
 				      | SEC_DATA));
 	      if (strcmp (TARGET_OS, "elf") != 0)
-		bfd_set_section_alignment (stdoutput, seg, 4);
+		record_alignment (stdoutput, seg, 4);
 	    }
 	  demand_empty_rest_of_line ();
 	}
@@ -10067,7 +10067,7 @@ s_change_sec (sec)
 				     SEC_ALLOC | SEC_LOAD | SEC_RELOC
 				     | SEC_DATA);
 	      if (strcmp (TARGET_OS, "elf") != 0)
-		bfd_set_section_alignment (stdoutput, seg, 4);
+		record_alignment (stdoutput, seg, 4);
 	    }
 	  demand_empty_rest_of_line ();
 	  break;

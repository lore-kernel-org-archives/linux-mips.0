Received: from Rene (htm-c-e0ae.mxs.adsl.euronet.nl [81.68.254.174])
	by smtp1.euronet.nl (Postfix) with SMTP id 7DF6B67258
	for <linux-mips@linux-mips.org>; Thu, 19 May 2005 10:09:50 +0200 (MEST)
Message-ID: <002901c55c4a$2030ede0$0a21a8c0@Rene>
From: =?iso-8859-1?Q?Ren=E9_Schouten?= <reneschouten@seldi.nl>
Subject: compiling pcmcia utils for mips
Date: Thu, 19 May 2005 10:09:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 8bit
Return-Path: <reneschouten@seldi.nl>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050519080948.5509Z0PSdGotehQDO0YvPyMxcq3lNnXGzLUtj5peoSs@z>

Hi,

I want to enable pcmcia on a mips32 processor

I do have everything exept the cardmgr and cardctl programs that should be 
in the /sbin directory

I downloaded the pcmcia-cs-3.2.8.tar.tar., and i'm able to compile it with 
the standard compiler, but i'm not able to build "cardctl" and "cardmgr" 
with the crosscomipler.

My question: Can somebody give a link on where i can download the 2 files 
already compiled, or tell me what to change in the "pcmcia-cs-3.2.8.tar.tar" 
files for only compiling the two utilitis with a cross compiler?

René 

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199710230010.RAA272545@oz.engr.sgi.com>
Subject: Re: Step by step of my experience
Date: Wed, 22 Oct 1997 17:10:33 -0700 (PDT)
In-Reply-To: <344E7DB2.167E@nothingreal.com> from "Emmanuel Mogenet" at Oct 22, 97 03:26:58 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Emmanuel Mogenet <mgix@nothingreal.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971023001033.6C4bG2-zJrJOaXNE1KPRccM5oBRabdnrcoeMVTcpbVQ@z>

Emmanuel,

Thanks for the report.

:
:        EFS: <6> attempt to access beyond end of device
:        08:21 rw=0 want=1190802192, limit=4191574
:
:Conclusion: Wait for Ralf to finish the EFS driver !
:This is the exact bug he was talking about.
:
Actually, it is Mike Shaver, we talked about this one pretty
recently, he is pretty busy but when he find some time to fix
this it would make things much simpler.

Hope someone would be able to answer the sash booting question.
-- 
Peace, Ariel

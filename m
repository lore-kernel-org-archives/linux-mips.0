Received: from mail.hcrest.com ([12.173.51.131]:33231 "EHLO mail.hcrest.com")
	by ftp.linux-mips.org with ESMTP id S20022404AbXCWOwA convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 23 Mar 2007 14:52:00 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: flush_anon_page for MIPS
Date: Fri, 23 Mar 2007 10:51:32 -0400
Message-ID: <36E4692623C5974BA6661C0B18EE8EDF6CD36D@MAILSERV.hcrest.com>
In-Reply-To: <20070323141939.GB17311@linux-mips.org>
From: "Ravi Pratap" <Ravi.Pratap@hillcrestlabs.com>
Return-Path: <Ravi.Pratap@hillcrestlabs.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-mips@linux-mips.org
Message-ID: <20070323145132.uNfDPE3aJRv2TXtTFbAQHSAB5gSIRU3b1vMrIY3W20E@z>

> From: Ralf Baechle [mailto:ralf@linux-mips.org] 
> Sent: Friday, March 23, 2007 10:20 AM
> To: Miklos Szeredi
> Cc: linux-mips@linux-mips.org; Ravi Pratap
> Subject: Re: flush_anon_page for MIPS
> 
> On Thu, Mar 22, 2007 at 11:28:40PM +0100, Miklos Szeredi wrote:
> 
> > It seems that MIPS needs to implement flush_anon_page() for correct
> > operation of get_user_pages() on anonymous pages.
> > 
> > This function is already implemented in PARISC and ARM.  Also see
> > Documentation/cachetlb.txt.
>
> Was this one found by code inspection or actually triggered 
> by like FUSE?

It was actually triggered by FUSE.


Ravi.

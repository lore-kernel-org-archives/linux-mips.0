Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ghenriksen@acm.org (Gerald Henriksen)
Subject: Re: NTools ENewsFlash -- Report: NT 3.5x Faster Than Linux
Date: Wed, 14 Apr 1999 22:24:33 GMT
Message-ID: <371613c9.533557@hopper.acs.ryerson.ca>
References: <199904141820.LAA81406@oz.engr.sgi.com>
In-Reply-To: <199904141820.LAA81406@oz.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19990414222433.XB2TKn7RpyCHZKjAAn3BqMrc3OZJHd0GSeac6MF0a9I@z>

On Wed, 14 Apr 1999 11:20:47 -0700 (PDT), you wrote:

>[I'm forwarding a message that bounced.  Just thought some people
> may be interested.  To add to what Eric wrote, another thing that
> I find strange is that they are comparing NT 3.5 rather than the
> latest NT 4.x to Linux.  I also believe some of the results
> are missing crucial details, like how the two very different
> web servers were configured (e.g. standalone vs from inetd,
> ssi turned on etc.) who paid for the report, full disclosures...
> -- Ariel]

A couple of clarifications (more info can be found by checking out
Slashdot, which carried the story Tuesday and at this point has over
700 comments)

1) they used NT Server 4

2) Microsoft paid for the testing (says so on the page that reports
the results)

3) they did compile a Linux kernel as they had to update Red Hat 5.2
to the 2.2.2 kernel, and they also mention the 3 changes they made to
the kernel config.  They didn't however do much to optimize Linux

4) someone even dug up the message they posted asking for help, but
they ignored at leat the response that told them to forget wasting 4
CPUs on a web server.  Note that they also goofed in their plea for
help, claiming that they were using Apache 2.* which doesn't exist.



-------------------------------------------------------------------------
 Gerald Henriksen                                        gerald@rose.com
 4th Year Computer Science                            ghenriksen@acm.org
 Ryerson Polytechnic University                  ghenriks@scs.ryerson.ca

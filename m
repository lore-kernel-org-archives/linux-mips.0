Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0ypIvl-000aOnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: New 2.0.107 console scheme
Date: Thu, 25 Jun 1998 21:47:41 +0100 (BST)
In-Reply-To: <3592B271.14F268F4@csd.sgi.com> from "Jesse Barnes" at Jun 25, 98 01:26:25 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Jesse Barnes <jesseba@rock.csd.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980625204741.dkd8-lg1_LyFIFgBMEAWJvRNoXwfBHowSlBE22w5VCE@z>

> Does the main kernel source tree have support for Indys natively, and
> if so, is the new fbcon method supported for the console?  

Almost and no. Its not fb_con thats relevant for the indy. fbcon is a directly
accessible bitmapped display. The indy will need to use abscon directly  to
issue newport commands

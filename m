Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199706261846.LAA11570@oz.engr.sgi.com>
Subject: anon-ftp enabled on linus
Date: Thu, 26 Jun 1997 11:46:22 -0700 (PDT)
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970626184622.kQGxYy92eVvtjbOz47qx7mYJQOSv2n-P-izvbgVCM6w@z>

FYI:

I just enabled public ftp access to linus.linux.sgi.com
ftpd runs as user/group  ftp/ftp.

The chroot'ed location (~ftp) is /src (where the CVS tree resides)

I made sure that the source tree has no world write permissions
or ftp group write permissions anywhere.

Since IRIX comes only with a dynamically liked '/bin/ls'
I had to add /lib/rld libc.so and /dev/zero rooted at /src
for dir to work.  I made all the permissions secure but
another check would be appreciated.

If anyone feels like building the latest wu-ftpd (with all security
patches) and replace the SGI ftpd - welcome.

A web site is planned too.  I hope we got a volunteer to set it up.

Let's keep the public areas only on the /src partition. I suggest
/src/www (or some such) for the web doc root.

-- 
Peace, Ariel

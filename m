Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199709052036.NAA29563@oz.engr.sgi.com>
Subject: 2.1.53 (from Linus)
Date: Fri, 5 Sep 1997 13:36:12 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970905203612.c-9VF24sn2cJYODQW7iQjIM1Ra-gsGg2TNSlt8JNatc@z>

Just thought this would be of relevance to some:

Subject: Linux-2.1.53..
From: Linus Torvalds <torvalds@transmeta.com>
Date: Thu, 4 Sep 1997 17:10:27 -0700
Message-ID: <Pine.LNX.3.95.970904170831.428J-100000@penguin.transmeta.com>
Newsgroups: .mlist. linux-kernel linux-kernel@vger.rutgers.edu


I released a 2.1.53, which fixes two major bugs in the 2.1.x series. Ingo
Molnar found one (and hopefully _the_) reason for dcache corruption in
d_move(), and David Miller found and fixed a TCP-related crash-inducer. 

In short, I hope 2.1.53 will finally be stable for people,

                        Linus



-- 
Peace, Ariel

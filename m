Date: Tue, 22 Aug 2000 08:53:49 -0700
From: Shrijeet Mukherjee <shm@cthulhu.engr.sgi.com>
Subject: Re: [linux-fbdev] SGI VW 540, fbdev and pot pourii of faults and
 evidence..:-)
In-Reply-To: <Pine.LNX.4.10.10008221138450.664-100000@maxwell.futurevision.com>
Message-ID: <Pine.SGI.4.21.0008220847450.264415-100000@tantrik.engr.sgi.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
Cc: linux-fbdev@vuser.vu.union.edu, Linux porting team <linux@cthulhu.engr.sgi.com>
Message-ID: <20000822155349.BRSaegEG7GFFrMfwh6UOwTh3R7t7472QEkY4I0bs-3Q@z>

On Tue, 22 Aug 2000, James Simmons wrote:

JS>> I don't speak for SGI, but in the past I think they said that the
JS>> specs basically do not exist in a releasable form.  Basically, the
JS>> hardware developers and software developers worked in the same hallway
JS>> and the development was of the form "hey Joe, how do I program the
JS>> zapbot to do foobaz?"
JS>
JS>Actually you are right. The lack of docs internally in SGI has caused this
JS>problem. This also has had the bad side effect of when they lose a
JS>critical employee then no one else has a clue on how it program it. You
JS>have to start from scratch. 
JS>

Well as I have tried to explain in the past the situation is not as cut
and dry as all that. For most hardware systems, well written driver code
is a good place to start. (in fact al of the internal port to linux for
the 320 was done without formal docs, or the engg's to talk to)

The real problem is that the 320 gfx family uses a SGI style
high-performance which is different from the AGP style approach that the
other guys use. Porting this to linux .. or more than knowing how the
hardware works .. since we need to port a very complicated mechanism, for
which linux may not have obvious and ready replacements.

On top of that .. there are potentially Intellectual Property issues with
the management style. Thus the concerns with just releasing the specs.

Since this is a recurring question, are there people on this list that are
personally motivated to try and port this system over ?

Std Disclaimer: I am not speaking for SGI .. all opinions expressed here
and mine and mine alone.

Thanx

-- 
--------------------------------------------------------------------------
Shrijeet Mukherjee,    		        Advanced Graphics, SGI
http://reality.sgi.com/shm_engr     	phone: 650-933-5312
email: shm@sgi.com, shrijeet@hotmail.com
--------------------------------------------------------------------------
Where there is a will, there is a way. If a way cannot be found, 
it is the will that is suspect ..                                   -- shm 

Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705301513.RAA23721@informatik.uni-koblenz.de>
Subject: Re: userland cometh
Date: Fri, 30 May 1997 17:13:52 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970530105637.10806A-100000@lager.engsoc.carleton.ca> from "Alex deVries" at May 30, 97 11:02:49 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: shaver@neon.ingenia.ca, ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970530151352.W55EnL0eVYSFA0jqyeUGwC6m7kipAeen1C1nDFxBSyM@z>

Hi,

> > Actually, I think it'll be my cohort Alex who'll be building most of
> > them.  He likes RPM in a way that's a little frightening (hi, Alex!). =)
> 
> I am, yes, sitting on the edge of my seat for Mike to get the network
> working so I can have access to the machine.  Mike's working on the
> network now to stop my endless pestering.
> 
> The priority will be getting rpm itself to compile properly, although I
> don't anticipate any huge problems.  I just need to tell it that
> Linux/mips exists, I suspect.

This and another one or two minor patches were required to make rpm
build on my machine.

> There's a large lump of joy in knowing that gcc/libc etc work properly.
> The rest is easy.

Trying to build and use a distribution will help us alot to find the bugs.

> > I can imagine.  I'm not looking to be a distribution (yet). =)
> 
> I suspect if we do a good enough job of porting the bulk of the RPMS that
> RedHat will take the effort seriously.  There'll be a lot of RPMs to port,
> though... 

Most of the changes we need to do are already covered by some other patch
files in the SRPMs.  For example many packages already contain GNU libc
patches; in some packages the GNU libc patches are disguised as Alpha
patches.  And GNU libc patches are 90% of what we need to patch.

  Ralf

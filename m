From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202010952.KAA23996@copsun18.mips.com>
Subject: Re: [patch] linux 2.4.17: An mb() rework
Date: Fri, 1 Feb 2002 10:52:42 +0100 (MET)
In-Reply-To: <Pine.LNX.3.96.1020131180511.14195A-100000@wakko.deltatee.com> from "Jason Gunthorpe" at Jan 31, 2002 11:44:30 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: jgg@debian.org
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20020201095242.9jDFDy-Ir9upwQ_yw9B3hi9efL3JZdc7NZPg72kdwRs@z>

Jason Gunthorpe writes:
> 
> 
> On Thu, 31 Jan 2002, Maciej W. Rozycki wrote:
> 
> >  Hmm, wmb() is pretty clearly defined.  The current implementation does
> > not enforce strict ordering and is thus incorrect.  Note that the R4400
> > manual explicitly states a cached write can bypass an uncached one, hence
> > the CPU may exploit weak ordering under certain circumstances.  The "sync" 
> > instruction was specifically defined to avoid such a risk.
> 
> Yes, you are correct. I suppose *mb() must also work correctly with the
> cache flush macros - didn't think about that one! 
> 
> I'm afraid I don't have any manuals for any of the MIPS chips just 3rd
> party ones SB1, RM7K and SR71000 - which is why I have some many
> odd questions. :>
> 
> > > No, a sync will still empty the write buffer. It may halt the pipeline for
> > > many (~80 perhaps) cycles while posted write data is dumped to the system
> > > controller.
> > 
> >  Then it's an implementation bug.  For a CPU in the UP mode "sync" is only
> > defined to prevent write and read reordering -- there is nothing about
> > flushing.

Not quite. Extract from the MIPS32 Architecture Reference Manual (available
on www.mips.com, documentation section):

SYNC

Purpose: To order loads and stores.

Description:

* SYNC affects only uncached and cached coherent loads and stores. The
loads and stores that occur before the SYNC must be completed before the
loads and stores after the SYNC are allowed to start. 

* Loads are completed when the destination register is written. Stores
are completed when the stored value is visible to every other processor
in the system. 

* SYNC is required, potentially in conjunction with SSNOP, to guarantee
that memory reference results are visible across operating mode changes.
For example, a SYNC is required on some implementations on entry to and
exit from Debug Mode to guarantee that memory affects are handled
correctly. Detailed Description: 

* When the stype field has a value of zero, every synchronizable load
and store that occurs in the instruction stream before the SYNC
instruction must be globally performed before any synchronizable load or
store that occurs after the SYNC can be performed, with respect to any
other processor or coherent I/O module. 

* SYNC does not guarantee the order in which instruction fetches are
performed. The stype values 1-31 are reserved; they produce the same
result as the value zero. 

----------- end of extract

The interesting one is the second-last bullet, and where the
synchronization point lies. All the cores from MIPS technologies provide
the means through lines and/or signalling on the bus interface to move
the synchronization point outside the processor. 

That is, without doing anything additional, the processor itself will
empty all writebuffers and present the writes on the bus interface
before any bus transaction of an instruction following the sync will
appear on the bus interface.

Through the use of the additional signalling mentioned above, the system
logic can choose to delay even more, thus moving the synchronization point
further out.

/Hartvig

--
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556

Received: from ams-iport-1.cisco.com ([144.254.224.140]:47400 "EHLO
	ams-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20037586AbWKLGrc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 12 Nov 2006 06:47:32 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Sync operation in atomic_add_return()
Date: Sun, 12 Nov 2006 07:46:39 +0100
Message-ID: <E98CBCB9ACC07244969BE4541EC0A7830317CEE5@xmb-ams-33b.emea.cisco.com>
From: "Gideon Stupp \(gstupp\)" <gstupp@cisco.com>
Return-Path: <gstupp@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kaz Kylheku <kaz@zeugmasystems.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20061112064639.RfF8ujNHY9Uw0KUMVN_IR3-_5G0j_df6PCYCrP_wD-k@z>

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Kaz Kylheku
> Sent: Monday, November 06, 2006 8:18 PM
> To: linux-mips@linux-mips.org
> Subject: RE: Sync operation in atomic_add_return()
> 
> Gideon Stupp wrote:
> > Hi,
> > I am trying to figure out why there is a sync operation in 
> > linux/include/asm-mips/atomic.h:atomic_add_return().
> > I believe it was added in the linux-2.4.19 patch, but can't 
> trace the 
> > reason. Can anyone help?
> 
> Is it just unwarranted paranoia? There does not appear to be 
> a need for the sync within the atomic_add_return code itself.
> 
> But it might be that the code which calls this function needs 
> the sync.
> 
> Without looking at any code whatsoever, here is a general hypothesis.
> 
> In what situation might you /care/ about the return value of 
> an atomic add?
> 
> Suppose atomic increments and decrements are being used for 
> reference counting. If you know that you hold the reference 
> to an object, you can call atomic_add to increase the 
> reference count without caring about the return value, and no 
> sync is needed in that situation.
> 
> Suppose, however, that atomic_add is used to pick up a reference.
> Suppose you have a pool of ``dead'' objects with reference 
> counts of zero, and want to recycle an object from such a 
> pool. You might use atomic_add_return to examine the 
> reference counts of the objects in this pool one by one until 
> you get a 1 return. You might get something other than a 1 
> return if racing against another processor which is tryiing 
> to pick up the same object.
> 
> In this situation, if you successfully get the object, you do 
> want to do a sync, since the object is being handed off 
> between two processors.
> Before the object was put into the pool, its fields were 
> updated, since it was being cleaned up. You would not want 
> the new owner, by chance, to observe stale values of those fields.
> 
> I.e., to put it briefly, atomic_add_return can have "acquire" 
> semantics.
> 

Thanks for the reply.  I also checked the Alpha implementation ( the
only other architecture I know of with non serializing atomic operations
) and indeed there is an explicit smp_mb() in atomic_add_return() and
nowhere else.  So I guess this is the convention.

Gideon.

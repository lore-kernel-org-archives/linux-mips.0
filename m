Message-ID: <00b401c228ba$88b29bf0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Sigcontext->sc_pc Passed to User
Date: Thu, 11 Jul 2002 11:08:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020711090821.49T3wkuojxFxv6lmBwcg-VOfg1magnaRPuQZ5BKw_ys@z>

In responding to an enquiry from one of MIPS' third-party
software vendors, I noted something that seems a little
broken to me in the current (and maybe all historical)
MIPS/Linux kernels.  Please forgive me for opening
old wounds if this has been beaten to death in the past.

When a user catches a signal, such as SIGBUS, the
signal "payload" includes a pointer to a sigcontext
structure on the stack, containing the state of the
CPU when the exception associated with the signal
occurred.  But not exactly.  We seem to consistently
call compute_return_epc() before send_sig() or
force_sig().  This results in the user being passed
an indication of the faulting PC that is one instruction
past the true location.  That would be no problem,
except that the faulting instruction may have been 
in a branch delay slot, such that there is no practical
and reliable way for the signal handler to determine
which instruction failed on the basis of the sigcontext
data.

It is, of course, important that execution resume
at the instruction following any instruction generating
an exception/signal.  But that's not the same thing
as saying that the sigcontext should report the resumption
EPC instead of the faulting EPC.  There are various
ways of dealing with this, but before going into any
of them, I'm curious as to whether this has been 
discussed before, and whether anyone thinks that 
things really should be the way they are.

            Regards,

            Kevin K.

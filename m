Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199904231731.KAA43957@oz.engr.sgi.com>
Subject: Re: am-utils and NIS (fwd)
Date: Fri, 23 Apr 1999 10:31:47 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19990423173147.2-TMvGhwCifRCl-1jQZOZpVlHQu-VtXujpkTGIhkqmY@z>

[forwarding bounced message from ralf who changed addresses...]
-- 
Peace, Ariel

From: Ralf Baechle <ralf@uni-koblenz.de>
To: Charles Lepple <clepple@foo.tho.org>, Linux/SGI <linux@cthulhu>
Subject: Re: am-utils and NIS
References: <371FE405.2F817623@foo.tho.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Mailer: Mutt 0.93.2
In-Reply-To: <371FE405.2F817623@foo.tho.org>; from Charles Lepple on Fri, Apr 23, 1999 at 03:07:49AM +0000
X-Accept-Language: de,en,fr

On Fri, Apr 23, 1999 at 03:07:49AM +0000, Charles Lepple wrote:

> Anyone have any experience with either of these under Linux/SGI? In
> trying to rebuild the am-utils package to support NIS maps, I keep
> getting this situation -- happens each time I try it :-(
> 
> [...]
> gcc -shared -Wl,-soname -Wl,libamu.so.1 -o .libs/libamu.so.1.0.1
> misc_rpc.lo mount_fs.lo mtab.lo nfs_prot_xdr.lo util.lo wire.lo
> xdr_func.lo xutil.lo transputil.lo mtabutil.lo mountutil.lo umount_fs.lo
> collect2: ld terminated with signal 6 [Aborted]
> make[2]: *** [libamu.la] Error 1

That is a known and already fixed bug in libbfd.  Just get the newest
version of binutils 2.8.1 from the Redhat 5.2 directory on
ftp.linux.sgi.com.

> I don't know how related this is, but while ypmatch-type calls work OK,
> ypcat generally returns errors like this:
> 
> green:~$ ypcat group 
> eegrad:*:4000:test
> eeugrad:*:6000:
> faculty:*:2000:
> staff:*:10:azam,harper,marchany,sysacct,clepple
> eestaff:*:3000:azam,harper,marchany,sysacct
> yp_all: clnt_call: RPC: Program not registered
> [above repeats 3 to 5 times, then terminates with...]
> No such map group.byname. Reason: RPC failure on NIS operation
> 
> Sorry to bug you all about this -- I know that NIS probably isn't high
> on everyone's priority list...

Can you send me the strace output of the failing command?

  Ralf

Received: from mail.linuxfoundation.org ([140.211.169.12]:51362 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992214AbdFIKE5ZWNkA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Jun 2017 12:04:57 +0200
Date: Fri, 9 Jun 2017 12:04:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] tty: add TIOCGPTPEER ioctl
Message-ID: <20170609100442.GA1405@kroah.com>
References: <20170603141515.9529-1-asarai@suse.de>
 <20170603141515.9529-3-asarai@suse.de>
 <20170609092659.GA26933@kroah.com>
 <44c2b6c7-63ee-5c7f-cc77-5e1bcd69eea4@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44c2b6c7-63ee-5c7f-cc77-5e1bcd69eea4@suse.de>
Return-Path: <gregkh@linuxfoundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksa Sarai <asarai@suse.de>
Cc: Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>, Valentin Rothberg <vrothberg@suse.com>
Message-ID: <20170609100442.uuJqJAuuTDm0oeWLaCDG_XDnGyL40KDUQcbJm48inFQ@z>

On Fri, Jun 09, 2017 at 07:50:43PM +1000, Aleksa Sarai wrote:
> > > When opening the slave end of a PTY, it is not possible for userspace to
> > > safely ensure that /dev/pts/$num is actually a slave (in cases where the
> > > mount namespace in which devpts was mounted is controlled by an
> > > untrusted process). In addition, there are several unresolvable
> > > race conditions if userspace were to attempt to detect attacks through
> > > stat(2) and other similar methods [in addition it is not clear how
> > > userspace could detect attacks involving FUSE].
> > > 
> > > Resolve this by providing an interface for userpace to safely open the
> > > "peer" end of a PTY file descriptor by using the dentry cached by
> > > devpts. Since it is not possible to have an open master PTY without
> > > having its slave exposed in /dev/pts this interface is safe. This
> > > interface currently does not provide a way to get the master pty (since
> > > it is not clear whether such an interface is safe or even useful).
> > > 
> > > Cc: Christian Brauner <christian.brauner@ubuntu.com>
> > > Cc: Valentin Rothberg <vrothberg@suse.com>
> > > Signed-off-by: Aleksa Sarai <asarai@suse.de>
> > 
> > Is this going to be documented anywhere?  Is there a man page update
> > that also goes along with this?
> 
> I will add one, I didn't know where the man-pages project is hosted / where
> patches get pushed? What is the ML?

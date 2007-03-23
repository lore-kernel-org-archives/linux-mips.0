Received: from localhost.localdomain ([127.0.0.1]:2947 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20022388AbXCWOTu (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 23 Mar 2007 14:19:50 +0000
Date: Fri, 23 Mar 2007 14:19:39 +0000
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: flush_anon_page for MIPS
Message-ID: <20070323141939.GB17311@linux-mips.org>
References: <E1HUVlw-00034H-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1HUVlw-00034H-00@dorka.pomaz.szeredi.hu>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-mips@linux-mips.org, Ravi.Pratap@hillcrestlabs.com
Message-ID: <20070323141939.OlgAfAJL6xDh9NFg87vEYkUcN-eHM4L05nHj5_NI33s@z>

On Thu, Mar 22, 2007 at 11:28:40PM +0100, Miklos Szeredi wrote:

> It seems that MIPS needs to implement flush_anon_page() for correct
> operation of get_user_pages() on anonymous pages.
> 
> This function is already implemented in PARISC and ARM.  Also see
> Documentation/cachetlb.txt.

**GRRRRR**

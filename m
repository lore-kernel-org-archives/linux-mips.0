Received: from fury.csh.rit.edu (fury.csh.rit.edu [129.21.60.5])
	by mcp.csh.rit.edu (Postfix) with ESMTP id 958D84376
	for <linux-mips@linux-mips.org>; Mon,  2 Sep 2002 16:44:08 -0400 (EDT)
Date: Mon, 2 Sep 2002 16:43:55 -0400 (EDT)
From: George Gensure <werkt@csh.rit.edu>
Subject: root-nfs hang and error
Message-ID: <Pine.SOL.4.31.0209021634320.24635-100000@fury.csh.rit.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <werkt@csh.rit.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20020902204355.9a621vbneXFP7Pa6A9psVxz-TWggdVc-oJf-v_AuTV4@z>

I've got a problem with a diskless install on an Indy.

When trying to mount an nfs to install to, I end up with about a 5 minute
hang (afterwards, though, all file transfer is seamless).  When rebooting
to boot from that nfs root I get an rpc error from the Indy and it refuses
to mount the root.  (obviously it panics).  The kernel is 2.4.16 and has
nfs v2 and v3 installed, as well as root nfs support.  Anyone have any
suggestions for getting this root to mount correctly?

-George
werkt@csh.rit.edu

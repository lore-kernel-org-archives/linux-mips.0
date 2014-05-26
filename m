Received: from bes.se.axis.com ([195.60.68.10]:39893 "EHLO bes.se.axis.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6818481AbaEZU5RySGiI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 May 2014 22:57:17 +0200
Received: from localhost (localhost [127.0.0.1])
        by bes.se.axis.com (Postfix) with ESMTP id 998342E354
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 22:57:10 +0200 (CEST)
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id tKJdVnoPJQ-p for <linux-mips@linux-mips.org>;
        Mon, 26 May 2014 22:57:01 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
        by bes.se.axis.com (Postfix) with ESMTP id E98472E353
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 22:57:01 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
        by postfix.imss71 (Postfix) with ESMTP id BE026E69
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 22:57:01 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
        by boulder.se.axis.com (Postfix) with ESMTP id B306DC04
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 22:57:01 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
        by thoth.se.axis.com (Postfix) with ESMTP id B109E34005
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 22:57:01 +0200 (CEST)
From: Mikael Starvik <mikael.starvik@axis.com>
Date: Mon, 26 May 2014 22:56:58 +0200
Subject: 1004K MT paging issue
Message-ID: <498838AF-48B0-4244-95C0-F590040E5E08@axis.com>
Content-Language: sv-SE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <mikael.starvik@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: Lars Persson <larper@axis.com>, Martin Santesson <martinsn@axis.com>
Message-ID: <20140526205658.BwoHQ7b1359go4hPut0N74DPVfDxoj54C9wsA02o5AY@z>

Hi!

We have a 1004K core with two VPEs with two TCs per VPE. We have a problem that is hard to debug and would like to know if anyone has seen or solved such an issue.

A multithreaded application is running. 
Twoapplication threads are running in one TC each on the same VPE.
A piece of code has been paged out.
Application thread 1 tries to execute the code and thus gets a page fault.
While the page fault is being handled the second application thread enters the same code.
For some reason it looks like application thread 2 is allowed to execute even if the page fault handling has not been finished yet.
Thread 2 executes the wrong code and typically gets a reserved instruction exception.

Any thougts?

BR
/Mikael

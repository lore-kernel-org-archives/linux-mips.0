Received: from mail-pb0-f45.google.com ([209.85.160.45]:52619 "EHLO
        mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6831301Ab3KZApLxOxQ8 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Nov 2013 01:45:11 +0100
Subject: Users pace crash on Netlogic XLP II processors
Mime-Version: 1.0 (1.0)
From: Jacky <cao.zhong1@gmail.com>
Content-Type: text/plain;
        charset=us-ascii
Message-ID: <B87042C0-FFC6-4B72-8A6A-09A3BD75F5E4@gmail.com>
Date: Tue, 26 Nov 2013 08:44:56 +0800
Content-Transfer-Encoding: 8BIT
Return-Path: <cao.zhong1@gmail.com>
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
Cc: "ralf@linux-mips.org" <ralf@linux-mips.org>
Message-ID: <20131126004456.3RSU8hzB06z8L8dP0ERjYpQhXoZK4HE9OyIg5m-BmqY@z>

Recently I experienced user space crash on kernel 2.6.32 after executables and memory foot print grow over particular size. As I found the crash reason is inconsistent I-cache which the code is correct in memory (or L2) but definitely wrong in L1 I-cache.

Should I-cache invalidate happen during page reclaim? And Which cache flush hook responsible for it? The work around is ugly need invalidate I cache on every page fill.

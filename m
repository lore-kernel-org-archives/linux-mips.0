Message-ID: <20020809084304.20279.qmail@uwdvg002.cms.usa.net>
Date: Fri, 09 Aug 2002 10:43:04 +0200
From: Sander Wichers <wichers@usa.net>
Subject: What cvs branch to use to compile mips64?
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020809084304.4sgnLXFmZYlRWoA52vfZTFFvYUA5WThwcHgeTsXCyOQ@z>

Hi, 
 
 
I'm "trying" to compile a mips 64 kernel for a IP28 Indigo 2 R10000 
(using the default binutils and egcs from oss.sgi.com) 
 
 
The default cvs branch will not link (even with minimal config options 
selected). The scsi wd93 driver in that branch will not compile at all.. 
 
 
So I tried the linux_2_5_[1/2] branches which compile completely but 
don't link: 
 
 
arch/mips64/mm/mm.o: In function `local_flush_tlb_mm': 
andes.c(.text+0x11f4): undefined reference to `flush_icache_all' 
arch/mips64/mm/mm.o: In function `local_flush_tlb_range': 
andes.c(.text+0x1374): undefined reference to `flush_icache_all' 
kernel/kernel.o: In function `schedule': 
sched.c(.text+0xfcc): undefined reference to `flush_icache_all' 
kernel/kernel.o: In function `set_cpus_allowed': 
sched.c(.text+0x1a54): undefined reference to `flush_icache_all' 
kernel/kernel.o: In function `end_lazy_tlb': 
exit.c(.text+0x6748): undefined reference to `flush_icache_all' 
fs/fs.o(.text+0xba98):exec.c: more undefined references to 
`flush_icache_all' follow 
fs/fs.o: In function `nfs_read_super': 
inode.c(.text+0x3a244): undefined reference to `nfs_v3_clientops' 
inode.c(.text+0x3a248): undefined reference to `nfs_v3_clientops' 
fs/fs.o: In function `nfs_async_unlink': 
unlink.c(.text+0x40310): undefined reference to `BUG' 
fs/fs.o: In function `unlock_buffer': 
buffer.c(.data+0x2f84): undefined reference to `nfs_version3' 
fs/fs.o: In function `invalidate_bdev': 
buffer.c(.data+0x3eb4): undefined reference to `nlmsvc_procedures4' 
fs/fs.o: In function `balance_dirty_state': 
buffer.c(.data+0x4854): undefined reference to `nlm_version4' 
arch/mips/sgi-ip22/ip22-kern.o: In function `indy_rtc_set_time': 
ip22-time.c(.text.init+0xd84): undefined reference to `bcops' 
ip22-time.c(.text.init+0xd88): undefined reference to `bcops' 
arch/mips64/arc/arclib.a(misc.o): In function `ArcHalt': 
misc.c(.text+0x0): undefined reference to `bcops' 
misc.c(.text+0x4): undefined reference to `bcops' 
arch/mips64/arc/arclib.a(misc.o): In function `ArcPowerDown': 
misc.c(.text+0x6c): undefined reference to `bcops' 
arch/mips64/arc/arclib.a(misc.o)(.text+0x70):misc.c: more undefined 
references to `bcops' follow 
drivers/char/char.o: In function `write_mem': 
mem.c(.text.init+0x138): undefined reference to `serial_console_init' 
net/network.o: In function `move_addr_to_user': 
socket.c(.text.init+0x78): undefined reference to `init_netlink' 
make: *** [vmlinux] Error 1 
 
 
Am I doing something wrong? Do I have the correct branch? Or do I need 
some patches? 
 
 
thanks in advance, 
 
 
Sander 
 

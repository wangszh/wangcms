  <tr>
						
                        <td class="text-muted"><?php echo $prefix; ?></span><?php echo $value['name']; ?></td>
						
                        <td>
                            <a href="{{ route('admin.category.index') }}/<?php echo $value['id']; ?>/edit"><i class="fa fa-fw fa-pencil" title="�޸�"></i></a>  
                            <a href="javascript:void(0);"><i class="fa fa-fw fa-link" title="�鿴"></i></a>  
                            <a href="javascript:void(0);"><i class="fa fa-fw fa-minus-circle delete_item" title="ɾ��" data-id="<?php echo $value['id']; ?>"></i></a>
                        </td>
						
                       <td class="text-green"><?php echo $value['slug']; ?>
                         
                        </td>
                        <td class="text-red"></td>
                      </tr>